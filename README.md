<div align="center">
  <img width="320px" src="https://raw.githubusercontent.com/aliisajad/Olist_Ecommerce/master/images/olist-logo.png" />
</div>
<h1 align="center">Olist E-Commerce Performance Report</h1>

<table align="center">
  <tr>
    <td width="1440">
      <h2 align="center">Client Background</h2>
      <body>
        <strong>Olist</strong> is a Brazilian e-commerce platform that connects small and medium-sized merchants to major online marketplaces across Brazil. Rather than selling products directly, Olist operates as an intermediary, enabling sellers to list their products through a single integrated storefront. <br>
        <br>
        The dataset covers over <strong>100,000 orders</strong> placed between <strong>2016 and 2018</strong>, spanning 9 relational tables including orders, customers, products, sellers, payments, and reviews. It captures a wide range of business dimensions including sales performance, product categories, customer behavior, and regional distribution across all Brazilian states. <br>
        <br>
        This analysis was conducted to evaluate Olist's commercial performance across its growth period. The key insights and recommendations focus on the following areas:
      </body>
      <h3>Northstar Metrics</h3>
      <h4>
        <ul>
          <li>Sales trends – Focusing on key metrics of sales revenue, number of orders, and average order value (AOV).</li>
          <li>Product performance – Analyzing top-performing categories by revenue and sales volume to inform strategic product decisions.</li>
          <li>Customer retention – Evaluating the split between one-time and repeat buyers and the revenue implications of improving retention.</li>
          <li>Regional results – Assessing geographic demand patterns and AOV variation across Brazilian states and regions.</li>
        </ul>
      </h4>
    </td>
  </tr>
</table>

<table align="center">
  <tr>
    <div width="920">
      <h1 align="center">Executive Summary</h1>
      <h3 align="center">Sales Revenue Analysis (2017–2018)</h3>
      <div align="center">
        <img width="1000" alt="Executive summary dashboard with KPI cards and sales revenue bar chart" src="https://raw.githubusercontent.com/aliisajad/Olist_Ecommerce/master/images/1.png" />
      </div>
      <td width="460" valign="top">
        <ol>
          <li>
            <strong>Rapid Revenue Growth in 2017:</strong>
            <ul>
              <li>Olist demonstrated consistent month-over-month revenue growth throughout 2017, increasing from $111K in January to a peak of $987K in November, representing nearly an 8x increase within a single year.</li>
              <li>This growth is driven primarily by rising order volumes rather than higher spend per order.</li>
              <li>Following that peak, revenue stabilized at around $930K per month throughout 2018, well above the overall period average of $659K, indicating the growth was sustainable and not purely event driven.</li>
            </ul>
          </li>
          <li>
            <strong>Critical Retention Gap:</strong>
            <ul>
              <li>The most critical strategic finding is in customer retention: 97% of customers purchased only once, yet repeat buyers generated $260 per customer compared to $138 for one-time buyers, nearly double the value.</li>
              <li>With an average return window of 81 days, there is a clear and time-bound opportunity to convert first-time buyers through targeted remarketing. Closing this gap is the single highest-leverage action available to Olist.</li>
            </ul>
          </li>
        </ol>
      </td>
      <td width="460" valign="top">
        <ol start="3">
          <li>
            <strong>Product & Regional Highlights:</strong>
            <ul>
              <li>Health & Beauty led all categories by revenue ($1.2M+), while São Paulo alone accounted for 38% of total sales.</li>
              <li>Seasonal peaks, particularly November Black Friday, drove disproportionate volume.</li>
              <li>Several untapped northern states showed higher average order values despite lower volumes, pointing to a regional expansion opportunity.</li>
            </ul>
          </li>
        </ol>
      </td>
    </div>
  </tr>
</table>

<h2 align="center">Dataset Structure and ERD (Entity Relationship Diagram)</h2>
<body>The Olist database consists of 9 relational tables: orders, customers, order_items, order_payments, order_reviews, products, sellers, product_category_name_translation, and geolocation — with a combined record count exceeding 100,000 orders.</body>
<div align="center">
  <img width="680" src="https://raw.githubusercontent.com/aliisajad/Olist_Ecommerce/master/images/erd.png" alt="Entity Relationship Diagram of the Olist database" />
</div>

<h1 align="center">Insights Deep-Dive</h1>

<table align="center">
  <tr>
    <h1 align="center">Sales Trends</h1>
    <td width="1000">
      <img width="300" src="https://raw.githubusercontent.com/aliisajad/Olist_Ecommerce/master/images/2.png" alt="Sales Revenue line chart" />
    </td>
    <td width="1000">
      <img width="300" src="https://raw.githubusercontent.com/aliisajad/Olist_Ecommerce/master/images/3.png" alt="AOV line chart" />
    </td>
    <td width="1000">
      <img width="300" src="https://raw.githubusercontent.com/aliisajad/Olist_Ecommerce/master/images/4.png" alt="Number of Orders line chart" />
    </td>
  </tr>
</table>

<table>
  <tr>
    <td>
      <strong>Sales Revenue</strong>
      <ol>
        <li>Strong revenue growth throughout 2017
          <ul>
            <li>Revenue increased from $111K in January to nearly $987K in November 2017, representing an 8x increase within a single year.</li>
            <li>Growth accelerated in Q4, with November recording the highest monthly revenue.</li>
          </ul>
        </li>
        <li>Revenue Stabilization in 2018
          <ul>
            <li>Following the November peak, monthly revenue remained consistently above the overall average of $659K throughout most of 2018.</li>
            <li>Revenue fluctuated between roughly $830K and $950K, indicating sustained demand.</li>
          </ul>
        </li>
        <li>Seasonal Demand Patterns
          <ul>
            <li>A temporary slowdown occurred during June–July 2017 before recovering in Q4.</li>
            <li>Q1 2018 experienced a post-holiday decline before rebounding between March and May.</li>
            <li>The strongest performance aligns with major shopping periods, particularly Black Friday and the holiday season.</li>
          </ul>
        </li>
      </ol>
      <strong>Average Order Value</strong>
      <ol>
        <li>AOV Remained Relatively Stable
          <ul>
            <li>The average AOV across the analysis period was approximately $121.</li>
            <li>Most monthly values remained within a narrow range of $109–$133.</li>
          </ul>
        </li>
        <li>Limited Long-Term Growth
          <ul>
            <li>While AOV experienced short-term fluctuations, there was no significant upward trend over time.</li>
            <li>The highest AOV occurred in April 2017 at $133, while the lowest occurred in July 2017 at $109.</li>
          </ul>
        </li>
        <li>Recovery During 2018
          <ul>
            <li>After declining through late 2017 and early 2018, AOV recovered and remained near or above the average during much of Q2 2018.</li>
          </ul>
        </li>
      </ol>
      <strong>Order Count</strong>
      <ol>
        <li>Order Volume Grew Significantly
          <ul>
            <li>Monthly orders increased from 750 orders in January 2017 to 7,289 orders by late 2017.</li>
            <li>This growth closely mirrors the revenue trend.</li>
          </ul>
        </li>
        <li>November 2017 Order Spike
          <ul>
            <li>Order count reached its highest level during the same period that revenue peaked.</li>
            <li>This indicates that the November 2017 revenue spike was largely driven by increased order volume.</li>
          </ul>
        </li>
        <li>Sustained Performance in 2018
          <ul>
            <li>Order volume remained consistently above the overall average of 4,811 orders per month throughout 2018.</li>
            <li>While customers spent slightly less per order during Q4 2017 and Q1 2018, the increase in order volume offset the decline in AOV, resulting in higher overall sales revenue.</li>
          </ul>
        </li>
      </ol>
    </td>
  </tr>
</table>

<table align="center">
  <h1 align="center">Product Performance</h1>
  <tr>
    <td width="700" align="center">
      <img width="650" src="https://raw.githubusercontent.com/aliisajad/Olist_Ecommerce/master/images/5.png" alt="Product performance scatter plot" />
    </td>
    <td width="700" align="center">
      <img width="650" src="https://raw.githubusercontent.com/aliisajad/Olist_Ecommerce/master/images/6.png" alt="Product performance scatter plot zoomed in on lower left cluster" />
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <strong>Top Categories by Revenue & Sales Volume</strong>
      <ol>
        <li><strong>Health & Beauty Was Olist's Best-Performing Category</strong>
          <ul>
            <li>Health & Beauty generated the highest total revenue, exceeding $1.2M, making it Olist's largest product category.</li>
            <li>The category maintained strong sales volume throughout the analysis period, reflecting consistent customer demand.</li>
            <li>Its combination of scale and revenue contribution makes it a key driver of overall business performance.</li>
          </ul>
        </li>
        <li><strong>Watches & Gifts Ranked Among the Top Revenue Generators</strong>
          <ul>
            <li>Watches & Gifts was one of the top revenue-generating categories despite selling fewer units than several other categories.</li>
            <li>The category's strong performance is supported by a relatively high AOV, allowing it to generate high revenue with fewer sales.</li>
            <li>This highlights the importance of higher-value product categories.</li>
          </ul>
        </li>
        <li><strong>Bed, Bath & Table Led in Units Sold</strong>
          <ul>
            <li>Bed, Bath & Table recorded the highest sales volume, with more than 11,000 items sold during the period.</li>
            <li>The category consistently attracted many purchases, demonstrating widespread consumer demand.</li>
            <li>Its strong transaction volume makes it one of the most important categories for driving customer activity on the platform.</li>
          </ul>
        </li>
      </ol>
      <strong>Scatter Plot Findings</strong>
      <ol>
        <li><strong>Revenue Is Driven by Both Sales Volume and AOV</strong>
          <ul>
            <li>Categories in the upper-right area of the scatter plot, such as Health & Beauty, Sports & Leisure, Computers & Accessories, and Bed, Bath & Table, show strong performance in both revenue and items sold.</li>
            <li>These categories consistently perform well in both sales volume and revenue, making them key drivers of business performance.</li>
          </ul>
        </li>
        <li><strong>Large Bubble Sizes Highlight High-AOV Categories</strong>
          <ul>
            <li>Categories such as Computers, Musical Instruments, and Small Appliances have noticeably larger bubbles, indicating higher AOV.</li>
            <li>These categories generate strong revenue even with lower sales volume because each transaction contributes more value.</li>
            <li>This suggests that premium or higher-priced categories can be important revenue drivers despite selling fewer units.</li>
          </ul>
        </li>
        <li><strong>High-Volume Categories Do Not Always Have the Highest AOV</strong>
          <ul>
            <li>Bed, Bath & Table has the highest number of items sold, but its bubble size is smaller compared to categories like Watches & Gifts or Computers.</li>
            <li>This suggests that Bed, Bath & Table relies more on transaction volume than high average order value.</li>
            <li>In contrast, Watches & Gifts relies more on higher AOV to generate revenue.</li>
          </ul>
        </li>
        <li><strong>Low-Revenue Categories Cluster in the Bottom-Left</strong>
          <ul>
            <li>Many smaller categories appear in the bottom-left section of the scatter plot, showing low revenue, low sales volume, and generally smaller AOV.</li>
            <li>These categories have limited impact on overall business performance and may require targeted marketing or product mix optimization.</li>
          </ul>
        </li>
      </ol>
    </td>
  </tr>
</table>

<table align="center">
  <h1 align="center">Category Trends Over Time</h1>
  <tr>
    <td align="center">
      <img width="900" src="https://raw.githubusercontent.com/aliisajad/Olist_Ecommerce/master/images/7.png" alt="Quarterly category performance heatmap 2017-2018" />
    </td>
  </tr>
  <tr>
    <td>
      <ol>
        <li><strong>Category Performance Strengthened Throughout 2018</strong>
          <ul>
            <li>Most top-performing categories display stronger sales intensity during 2018 compared to 2017.</li>
            <li>Health & Beauty, Computers & Accessories, Sports & Leisure, and Bed, Bath & Table experienced noticeable growth during this period.</li>
            <li>This indicates increasing demand across multiple product categories as the business matured.</li>
          </ul>
        </li>
        <li><strong>Seasonal Demand Patterns Are Visible Across Categories</strong>
          <ul>
            <li>Many categories show stronger performance during later quarters and early 2018 periods, suggesting the influence of promotional events and holiday shopping.</li>
            <li>Revenue concentration during these periods highlights the importance of effective seasonal marketing campaigns.</li>
          </ul>
        </li>
        <li><strong>Growth Was Distributed Across Multiple Categories</strong>
          <ul>
            <li>The heat map does not show dependence on a single category for growth.</li>
            <li>Instead, several categories experienced simultaneous increases in performance, indicating a well-diversified revenue base and reduced business risk.</li>
          </ul>
        </li>
      </ol>
    </td>
  </tr>
</table>

<table align="center">
  <h1 align="center">Customer Retention</h1>
  <tr>
    <td width="500" align="center">
      <img width="400" src="https://raw.githubusercontent.com/aliisajad/Olist_Ecommerce/master/images/8.png" alt="Donut chart showing 97% one-time vs 3% repeat customers" />
    </td>
    <td width="500" align="center">
      <img width="300" src="https://raw.githubusercontent.com/aliisajad/Olist_Ecommerce/master/images/9.png" alt="Bar chart comparing revenue of one-time vs repeat customers" />
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center">
      <img width="900" src="https://raw.githubusercontent.com/aliisajad/Olist_Ecommerce/master/images/10.png" alt="Customer retention summary table" />
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <ul>
        <li>The most striking finding in the dataset is that 97% of customers purchased only once. While a high proportion of one-time buyers is not unusual for e-commerce marketplaces where customers often arrive via search or promotions rather than brand loyalty, the scale here signals that Olist's growth was driven almost entirely by new customer acquisition. This represents a key risk, as the business depends on a constant flow of new customers, and any decline in customer acquisition would likely reduce revenue.</li>
        <li>Repeat customers are much more valuable than one-time buyers. On average, repeat customers generate $260 in revenue compared to $138 for one-time buyers, an increase of 88%. This difference is mainly because repeat customers purchase more often, not because they spend more per order. In fact, repeat customers spend slightly less per order ($106 vs. $126).</li>
        <li>This suggests that the main opportunity is to encourage customers to return rather than to increase spending in a single purchase. Since repeat customers make their next purchase after an average of 81 days, targeted marketing efforts during the 30–60 days after a purchase could help increase repeat purchases.</li>
        <li>Even a small increase in the share of repeat customers, from 3% to 6%, could significantly boost revenue without attracting additional new customers.</li>
      </ul>
    </td>
  </tr>
</table>

<table align="center">
  <h1 align="center">Regional Results</h1>
  <tr>
    <td width="500" align="center">
      <img width="450" src="https://raw.githubusercontent.com/aliisajad/Olist_Ecommerce/master/images/11.png" alt="Brazil choropleth map showing sales by state" />
    </td>
    <td width="500" align="center">
      <img width="450" src="https://raw.githubusercontent.com/aliisajad/Olist_Ecommerce/master/images/12.png" alt="Brazil choropleth map showing AOV by state" />
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <ol>
        <li><strong>São Paulo Dominates Olist's Revenue</strong>
          <ul>
            <li>São Paulo accounts for 38% of total revenue, making it Olist's largest market by a significant margin.</li>
            <li>The state's contribution far exceeds that of other regions, highlighting its importance to overall business performance.</li>
          </ul>
        </li>
        <li><strong>Revenue Is Concentrated in the Southeast Region</strong>
          <ul>
            <li>The sales map shows the strongest revenue performance in São Paulo, Minas Gerais, and Rio de Janeiro.</li>
            <li>States in the Southeast consistently outperform other regions, reflecting their larger populations and stronger economic activity.</li>
          </ul>
        </li>
        <li><strong>Northern States Show Higher AOV Despite Lower Revenue</strong>
          <ul>
            <li>The AOV map indicates that several states in the North and Northeast have higher average order values than many high-revenue states.</li>
            <li>However, these regions contribute less overall revenue due to lower sales volumes.</li>
            <li>This suggests an opportunity to increase revenue by expanding customer acquisition in these markets.</li>
          </ul>
        </li>
        <li><strong>Product Preferences Vary by Region</strong>
          <ul>
            <li>The regional heatmap shows noticeable differences in category performance across Brazil.</li>
            <li>Health & Beauty performs strongly across most regions, while categories such as Sports & Leisure, Watches & Gifts, and Computers & Accessories show stronger demand in specific regions.</li>
            <li>These differences highlight the importance of region-specific marketing and inventory strategies.</li>
          </ul>
        </li>
      </ol>
    </td>
  </tr>
</table>

<table align="center">
  <h1>Recommendations</h1>
  <h4>Based on the insights uncovered throughout the analysis, the following recommendations could help Olist improve revenue growth, customer retention, and regional expansion.</h4>
  <ul>
    <h3>Sales</h3>
    <li>Increase promotional activity during slower sales periods to reduce seasonal fluctuations.
      <ul><li>Revenue experienced noticeable slowdowns during mid-2017 and early 2018 before recovering later in the year.</li></ul>
    </li>
    <li>Leverage successful seasonal campaigns during peak shopping periods.
      <ul><li>Revenue and order volume peaked in November 2017, likely driven by Black Friday and holiday shopping demand.</li></ul>
    </li>
    <li>Continue focusing on customer acquisition initiatives.
      <ul><li>Revenue growth was primarily driven by increasing order volume rather than growth in Average Order Value (AOV).</li></ul>
    </li>
    <h3>Products</h3>
    <li>Prioritize inventory and marketing investment in top-performing categories.
      <ul><li>Health & Beauty generated the highest revenue, while Bed, Bath & Table recorded the highest sales volume.</li></ul>
    </li>
    <li>Expand high-AOV categories that generate strong revenue with fewer sales.
      <ul><li>Watches & Gifts, Computers, and Musical Instruments demonstrated strong revenue performance despite lower sales volume.</li></ul>
    </li>
    <li>Use category-level insights to optimize product assortment by region.
      <ul><li>Product demand varies across regions, suggesting opportunities for more targeted inventory allocation.</li></ul>
    </li>
    <h3>Customer Retention</h3>
    <li>Implement retention campaigns focused on encouraging second purchases.
      <ul><li>Repeat customers represent only 3% of the customer base but generate 6% of total revenue.</li></ul>
    </li>
    <li>Re-engage customers within the first three months after purchase.
      <ul><li>Repeat customers return after an average of 81 days, providing a clear window for remarketing efforts.</li></ul>
    </li>
    <li>Increase customer lifetime value through loyalty and personalized promotions.
      <ul><li>Repeat customers generate $260 in revenue per customer compared to $138 for one-time buyers.</li></ul>
    </li>
    <h3>Regions</h3>
    <li>Continue strengthening Olist's presence in São Paulo and the Southeast region.
      <ul><li>São Paulo alone accounts for 38% of total revenue and remains the company's most important market.</li></ul>
    </li>
    <li>Expand customer acquisition efforts in underpenetrated regions.
      <ul><li>Several Northern and Northeastern states show relatively high AOV despite generating lower overall revenue.</li></ul>
    </li>
    <li>Develop region-specific marketing strategies based on category demand.
      <ul><li>Product preferences vary across regions, creating opportunities for localized promotions and merchandising.</li></ul>
    </li>
  </ul>
</table>
