import Component from "@glimmer/component";
import { tracked } from "@glimmer/tracking";
import { service } from "@ember/service";
import { ajax } from "discourse/lib/ajax";
import { popupAjaxError } from "discourse/lib/ajax-error";

/**
 * Top-topics rail — rendered to the right of the categories stack on the
 * /categories route. Required because we use desktop_category_page_style
 * = "subcategories_with_featured_topics", which gives us parents-as-labels
 * + children-as-cards but DOES NOT include the TOP rail. We add it back here.
 *
 * Mounted in plugin outlet "discovery-categories-above" so the connector
 * lands inside the discovery.categories template root and CSS can grid it
 * into a right column (.discovery.categories .container { display: grid ... }).
 *
 * Endpoint: GET /top.json?period=monthly  → { topic_list: { topics: [...] } }
 */
export default class BirthrightTopRail extends Component {
  @service router;
  @service site;

  @tracked topics = [];
  @tracked loading = true;

  constructor() {
    super(...arguments);
    if (this.isCategoriesRoute) this.load();
  }

  get isCategoriesRoute() {
    return (this.router.currentRouteName || "").startsWith("discovery.categories");
  }

  async load() {
    try {
      const data = await ajax("/top.json?period=monthly&per_page=8");
      const topics = data?.topic_list?.topics || [];
      this.topics = topics.slice(0, 8).map((t) => {
        const category = this.site.categories.findBy("id", t.category_id);
        return {
          id: t.id,
          title: t.fancy_title || t.title,
          slug: t.slug,
          replies: t.posts_count - 1,
          time: t.last_posted_at,
          author: t.last_poster_username,
          categoryName: category?.name || "",
          categoryColor: category?.color ? `#${category.color}` : "#c8466a",
          url: `/t/${t.slug}/${t.id}`,
        };
      });
    } catch (e) {
      popupAjaxError(e);
    } finally {
      this.loading = false;
    }
  }

  <template>
    {{#if this.isCategoriesRoute}}
      <aside class="birthright-top-rail">
        <div class="br-rail-label">TOP</div>
        {{#if this.loading}}
          <div class="br-rail-loading">…</div>
        {{else}}
          <div class="br-rail-list">
            {{#each this.topics as |t|}}
              <a href={{t.url}} class="br-rail-row">
                <h4 class="br-rail-title">{{t.title}}</h4>
                <div class="br-rail-meta">
                  <span class="br-rail-replies">
                    <svg viewBox="0 0 24 24" width="11" height="11" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"/></svg>
                    {{t.replies}}
                  </span>
                  <span class="br-rail-cat">
                    <span class="br-rail-cat-dot" style="background:{{t.categoryColor}}"></span>{{t.categoryName}}
                  </span>
                  <span class="br-rail-time">{{t.time}}</span>
                </div>
              </a>
            {{/each}}
          </div>
        {{/if}}
      </aside>
    {{/if}}
  </template>
}
