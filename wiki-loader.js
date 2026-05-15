/**
 * Wiki Content Loader for Birthright.net domain pages
 * Fetches article content from MediaWiki API and renders it
 * in the Birthright design, inserted before the footer.
 */
(function() {
  // Extract domain name from page title (before the em-dash)
  const titleEl = document.querySelector('title');
  if (!titleEl) return;
  const rawName = titleEl.textContent.split('—')[0].split('–')[0].split('&mdash;')[0].trim();
  if (!rawName) return;
  // Title-case: "AERENWE" → "Aerenwe", "FIVE PEAKS" → "Five Peaks", "BARUK-AZHIK" → "Baruk-Azhik"
  const domainName = rawName.replace(/\w\S*/g, w => w.charAt(0).toUpperCase() + w.slice(1).toLowerCase());


  // Create wiki section
  const wikiSection = document.createElement('section');
  wikiSection.id = 'wiki-content-section';
  wikiSection.className = 'relative grain';
  wikiSection.style.cssText = 'background: var(--bg-secondary); padding: 4rem 0;';
  wikiSection.innerHTML = `
    <div class="max-w-[1600px] mx-auto px-6 lg:px-12">
      <div class="flex items-center justify-between mb-8">
        <div>
          <span class="typo-label" style="color: var(--gold);">From the Wiki</span>
          <h2 class="font-impact text-3xl lg:text-4xl tracking-wide uppercase mt-2" style="color: var(--text-primary);">${domainName}</h2>
        </div>
        <a href="/wiki/index.php?title=${encodeURIComponent(domainName)}" target="_blank" rel="noopener noreferrer"
           class="font-display text-xs tracking-[0.2em] uppercase px-4 py-2 transition-colors"
           style="color: var(--gold); border: 1px solid var(--border);">
          Edit on Wiki &rarr;
        </a>
      </div>
      <div id="wiki-article-body" style="
        font-family: 'Crimson Pro', serif;
        font-size: 1.1rem;
        line-height: 1.75;
        color: var(--text-secondary);
      ">
        <p class="typo-label" style="color: var(--text-muted);">Loading wiki article...</p>
      </div>
    </div>
  `;

  // Insert before footer
  const footer = document.querySelector('footer');
  if (footer) {
    footer.parentNode.insertBefore(wikiSection, footer);
  } else {
    document.body.appendChild(wikiSection);
  }

  // Style wiki content
  const style = document.createElement('style');
  style.textContent = `
    #wiki-article-body h1, #wiki-article-body h2 {
      font-family: 'Bebas Neue', sans-serif;
      font-size: 1.8rem;
      letter-spacing: 0.05em;
      color: var(--gold);
      margin: 2.5rem 0 1rem;
      text-transform: uppercase;
    }
    #wiki-article-body h3 {
      font-family: 'Cinzel', serif;
      font-size: 1.15rem;
      color: var(--text-primary);
      margin: 1.5rem 0 0.75rem;
    }
    #wiki-article-body p {
      margin-bottom: 1rem;
    }
    #wiki-article-body a {
      color: var(--gold);
      text-decoration: underline;
      text-underline-offset: 3px;
      transition: color 0.3s;
    }
    #wiki-article-body a:hover { color: var(--crimson); }
    #wiki-article-body a.new { color: var(--crimson); opacity: 0.6; }
    #wiki-article-body ul, #wiki-article-body ol {
      padding-left: 1.5rem;
      margin-bottom: 1rem;
    }
    #wiki-article-body li { margin-bottom: 0.4rem; }
    #wiki-article-body table {
      width: 100%;
      border-collapse: collapse;
      margin: 1.5rem 0;
    }
    #wiki-article-body th {
      font-family: 'Cinzel', serif;
      font-size: 0.8rem;
      letter-spacing: 0.15em;
      text-transform: uppercase;
      color: var(--gold);
      text-align: left;
      padding: 0.75rem;
      border-bottom: 2px solid var(--border);
    }
    #wiki-article-body td {
      padding: 0.6rem 0.75rem;
      border-bottom: 1px solid var(--border);
      color: var(--text-secondary);
      font-size: 0.95rem;
    }
    #wiki-article-body blockquote {
      border-left: 3px solid var(--gold);
      padding: 1rem 1.5rem;
      margin: 1.5rem 0;
      background: var(--bg-card);
      font-style: italic;
    }
    #wiki-article-body img {
      max-width: 100%;
      border: 1px solid var(--border);
    }
    #wiki-article-body .toc {
      background: var(--bg-card);
      border: 1px solid var(--border);
      padding: 1.5rem;
      margin-bottom: 2rem;
      display: none; /* Hide TOC since the page already has its own structure */
    }
    #wiki-article-body .mw-editsection { display: none; }
  `;
  document.head.appendChild(style);

  // Fetch wiki content
  fetch('/api.php?action=parse&page=' + encodeURIComponent(domainName) + '&format=json&prop=text&disableeditsection=true')
    .then(r => r.json())
    .then(data => {
      const body = document.getElementById('wiki-article-body');
      if (data.parse && data.parse.text) {
        // Rewrite internal wiki links to go through our /wiki/ proxy
        let html = data.parse.text['*'];
        html = html.replace(/href="\/wiki\//g, 'href="/wiki/index.php?title=');
        html = html.replace(/href="\/index.php/g, 'href="/wiki/index.php');
        body.innerHTML = html;
      } else {
        body.innerHTML = '<p style="color: var(--text-muted); font-style: italic;">No wiki article found for "' + domainName + '". <a href="/wiki/index.php?title=' + encodeURIComponent(domainName) + '&action=edit" target="_blank" style="color: var(--gold);">Create it?</a></p>';
      }
    })
    .catch(() => {
      document.getElementById('wiki-article-body').innerHTML = '<p style="color: var(--text-muted);">Could not load wiki content.</p>';
    });
})();
