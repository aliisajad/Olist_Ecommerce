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
              <li>Revenue grew from $111K in January 2017 to a peak of $987K in November 2017, representing nearly an 8x increase within a single year.</li>
              <li>Growth was driven primarily by rising order volumes rather than higher spend per order.</li>
              <li>The November 2017 peak aligned with Black Friday demand, with order count reaching 7,289 in the same month.</li>
            </ul>
          </li>
          <li>
            <strong>Sustained Performance in 2018:</strong>
            <ul>
              <li>Following the November peak, revenue stabilized at approximately $930K per month throughout 2018, well above the overall period average of $659K.</li>
              <li>This indicates that growth was sustainable and not purely event-driven.</li>
            </ul>
          </li>
        </ol>
      </td>
      <td width="460" valign="top">
        <ol start="3">
          <li>
            <strong>Critical Retention Gap:</strong>
            <ul>
              <li>97% of customers purchased only once, yet repeat buyers generated $260 per customer compared to $138 for one-time buyers — nearly double the value.</li>
              <li>With an average return window of 81 days, there is a clear and time-bound opportunity to convert first-time buyers through targeted remarketing.</li>
            </ul>
          </li>
          <li>
            <strong>Regional Concentration:</strong>
            <ul>
              <li>São Paulo alone accounted for 38% of total sales revenue.</li>
              <li>Several northern states showed higher AOV despite lower volumes, pointing to an untapped regional expansion opportunity.</li>
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
        <li>Consistent Growth Throughout 2017
          <ul>
            <li>Revenue increased from $111K in January to nearly $987K in November 2017, an 8x increase within a single year.</li>
            <li>Growth accelerated in Q4, with November recording the highest monthly revenue across the entire period.</li>
          </ul>
        </li>
        <li>Revenue Stabilization in 2018
          <ul>
            <li>Following the November peak, monthly revenue remained consistently above the overall average of $659K throughout most of 2018.</li>
            <li>Revenue fluctuated between roughly $830K and $950K, indicating sustained demand rather than a one-off spike.</li>
          </ul>
        </li>
        <li>Seasonal Demand Patterns
          <ul>
            <li>A temporary slowdown occurred during June–July 2017 before recovering in Q4.</li>
            <li>Q1 2018 experienced a post-holiday dip before rebounding between March and May.</li>
            <li>Strongest performance aligns with major shopping events, particularly Black Friday.</li>
          </ul>
        </li>
      </ol>
      <strong>Average Order Value</strong>
      <ol>
        <li>AOV Remained Relatively Stable
          <ul>
            <li>The average AOV across the period was approximately $121, with most months falling within a narrow range of $109–$133.</li>
            <li>There was no significant upward trend in AOV over time, indicating growth was volume-driven.</li>
          </ul>
        </li>
        <li>Recovery in Mid-2018
          <ul>
            <li>After declining through late 2017 and early 2018, AOV recovered and remained near or above the average during Q2 2018.</li>
          </ul>
        </li>
      </ol>
      <strong>Order Count</strong>
      <ol>
        <li>Order Volume Grew Significantly
          <ul>
            <li>Monthly orders grew from 750 in January 2017 to 7,289 by November 2017, closely mirroring the revenue trend.</li>
            <li>Order volume remained consistently above the overall average of 4,811 per month throughout 2018.</li>
          </ul>
        </li>
        <li>Volume Drove the November Peak
          <ul>
            <li>The November 2017 revenue spike was primarily driven by increased order volume, not higher AOV.</li>
            <li>Although customers spent slightly less per order during Q4 2017, the surge in order count more than offset the AOV decline.</li>
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
      <ol>
        <li><strong>Health & Beauty Was Olist's Best-Performing Category</strong>
          <ul>
            <li>Health & Beauty generated the highest total revenue, exceeding $1.2M, making it Olist's largest product category.</li>
            <li>Its combination of high volume and high revenue contribution makes it a key driver of overall business performance.</li>
          </ul>
        </li>
        <li><strong>Watches & Gifts Ranked Among the Top Revenue Generators</strong>
          <ul>
            <li>Watches & Gifts generated strong revenue despite selling fewer units than several other categories, supported by a relatively high AOV.</li>
            <li>This highlights the revenue potential of higher-value product categories.</li>
          </ul>
        </li>
        <li><strong>Bed, Bath & Table Led in Units Sold</strong>
          <ul>
            <li>Bed, Bath & Table recorded the highest sales volume, with more than 11,000 items sold during the period.</li>
            <li>Unlike Watches & Gifts, this category relies on transaction volume rather than high AOV to generate revenue.</li>
          </ul>
        </li>
        <li><strong>High-AOV Categories Generate Strong Revenue Despite Low Volume</strong>
          <ul>
            <li>Categories such as Computers, Musical Instruments, and Small Appliances have larger bubble sizes, indicating higher AOV despite lower sales volume.</li>
            <li>These categories demonstrate that premium product segments can drive meaningful revenue without high order counts.</li>
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
      <ul>
        <li>Most top-performing categories display stronger sales intensity during 2018 compared to 2017, indicating increasing demand as the business matured.</li>
        <li>Health & Beauty, Computers & Accessories, Sports & Leisure, and Bed, Bath & Table experienced noticeable growth in the later periods.</li>
        <li>Growth was distributed across multiple categories simultaneously, indicating a well-diversified revenue base and reduced single-category risk.</li>
        <li>Seasonal demand patterns are visible across categories, with stronger performance during later quarters aligning with promotional periods.</li>
      </ul>
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
        <li>97% of customers purchased only once. While high one-time buyer rates are common in marketplace e-commerce, the scale here signals that Olist's growth depended almost entirely on new customer acquisition — a key business risk.</li>
        <li>Repeat customers generate $260 in revenue per customer compared to $138 for one-time buyers, an 88% premium. This difference is driven by purchase frequency rather than higher spend per order — repeat customers actually spend slightly less per order ($106 vs. $126).</li>
        <li>The main retention opportunity is encouraging customers to return, not increasing their basket size. Since repeat customers return after an average of 81 days, targeted marketing in the 30–60 day window post-purchase represents the highest-leverage action available.</li>
        <li>Even a modest improvement — doubling the repeat customer rate from 3% to 6% — could significantly increase revenue without requiring additional customer acquisition spend.</li>
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
      <ul>
        <li>São Paulo dominates Olist's revenue, accounting for 38% of total sales. The Southeast region as a whole — São Paulo, Minas Gerais, and Rio de Janeiro — consistently outperforms other regions.</li>
        <li>Several Northern and Northeastern states show higher average order values despite generating lower total revenue, suggesting untapped demand that could be unlocked through targeted customer acquisition.</li>
        <li>Product preferences vary notably across regions. Health & Beauty performs strongly nationwide, while Sports & Leisure, Watches & Gifts, and Computer Accessories show stronger demand in specific regions — pointing to opportunities for localized marketing and inventory strategies.</li>
      </ul>
    </td>
  </tr>
</table>

<table align="center">
  <h1>Recommendations</h1>
  <h4>Based on the insights uncovered throughout the analysis, the following actions could help Olist improve revenue growth, customer retention, and regional expansion.</h4>
  <ul>
    <h3>Sales</h3>
    <li>Increase promotional activity during slower sales periods to reduce seasonal fluctuations.
      <ul><li>Revenue experienced noticeable slowdowns during mid-2017 and early 2018 before recovering later in each year.</li></ul>
    </li>
    <li>Leverage successful seasonal campaigns during peak shopping periods.
      <ul><li>Revenue and order volume peaked in November 2017, likely driven by Black Friday and holiday shopping demand.</li></ul>
    </li>
    <h3>Products</h3>
    <li>Prioritize inventory and marketing investment in top-performing categories.
      <ul><li>Health & Beauty generated the highest revenue, while Bed, Bath & Table recorded the highest sales volume.</li></ul>
    </li>
    <li>Expand high-AOV categories that generate strong revenue with fewer sales.
      <ul><li>Watches & Gifts, Computers, and Musical Instruments demonstrated strong revenue performance despite lower sales volume.</li></ul>
    </li>
    <h3>Customer Retention</h3>
    <li>Implement retention campaigns focused on encouraging second purchases.
      <ul><li>Repeat customers represent only 3% of the customer base but generate 6% of total revenue and nearly double the revenue per customer.</li></ul>
    </li>
    <li>Re-engage customers within the first three months after their initial purchase.
      <ul><li>Repeat customers return after an average of 81 days, providing a clear and actionable remarketing window.</li></ul>
    </li>
    <h3>Regions</h3>
    <li>Continue strengthening Olist's presence in São Paulo and the Southeast.
      <ul><li>São Paulo alone accounts for 38% of total revenue and remains the company's most important market.</li></ul>
    </li>
    <li>Expand customer acquisition efforts in underpenetrated northern and northeastern states.
      <ul><li>Several states in these regions show relatively high AOV despite low order volumes, indicating willingness to spend.</li></ul>
    </li>
    <li>Develop region-specific marketing strategies based on category demand patterns.
      <ul><li>Product preferences vary across regions, creating opportunities for localized promotions and more efficient inventory allocation.</li></ul>
    </li>
  </ul>
</table>
