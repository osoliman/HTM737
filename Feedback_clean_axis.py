from matplotlib.ticker import MaxNLocator

for domain in domains:
    plt.figure(figsize=(7, 5))
    
    sns.scatterplot(
        x=df_cond[domain],
        y=df_cond[tps],
        alpha=0.4,
        s=20
    )
    
    plt.gca().xaxis.set_major_locator(MaxNLocator(nbins=6, integer=True))
    plt.gca().yaxis.set_major_locator(MaxNLocator(nbins=6, integer=True))
    plt.gca().xaxis.set_major_formatter('{x:.0f}')
    plt.gca().yaxis.set_major_formatter('{x:.0f}')
    
    plt.title(f'{domain} vs Total Performance Score')
    plt.xlabel(domain)
    plt.ylabel('Total Performance Score')
    plt.show()
