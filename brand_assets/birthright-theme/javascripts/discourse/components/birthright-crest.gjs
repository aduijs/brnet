import Component from "@glimmer/component";

/**
 * Crest — the rotated diamond with a category letter.
 * Used as a category-icon replacement. Pass:
 *   @letter   one-character label (uppercase)
 *   @color    hex string (e.g. "#c8466a")
 */
export default class BirthrightCrest extends Component {
  get letter() { return (this.args.letter || "?").slice(0, 1).toUpperCase(); }
  get color()  { return this.args.color || "#c8466a"; }
  get style()  { return `--br-cat-color: ${this.color};`; }

  <template>
    <span class="birthright-crest" style={{this.style}}>
      <span class="br-crest-inner">
        <span class="br-crest-letter">{{this.letter}}</span>
      </span>
    </span>
  </template>
}
