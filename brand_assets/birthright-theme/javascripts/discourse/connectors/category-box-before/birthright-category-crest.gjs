import Component from "@glimmer/component";
import BirthrightCrest from "../../components/birthright-crest";
import { settings } from "discourse/lib/theme-settings-store";

/**
 * Mounted in plugin outlet "category-box-before" — Discourse renders this
 * before the category-box content. We use it to inject the crest in place
 * of the stock badge background image.
 *
 * The connector receives the category as @outletArgs.category.
 */
export default class BirthrightCategoryCrest extends Component {
  get category() { return this.args.outletArgs?.category; }

  get letter() {
    const name = this.category?.name || "?";
    return name.replace(/^(birthright|the)\s+/i, "")[0]?.toUpperCase() || "?";
  }

  get color() {
    const map = (settings.category_color_map || "").split(",")
      .map(s => s.trim().split(":"))
      .reduce((acc, [slug, hex]) => { if (slug && hex) acc[slug.trim()] = hex.trim(); return acc; }, {});
    const slug = this.category?.slug;
    return map[slug] || this.category?.color ? `#${this.category.color}` : "#c8466a";
  }

  <template>
    <BirthrightCrest @letter={{this.letter}} @color={{this.color}} />
  </template>
}
