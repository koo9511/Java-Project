package com.kh.danim.page;

public class Page implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4919871838375157864L;
	
	
	private int currentpage;	//현재페이지 
	private int listcount;		//db에서 불러온 게시글 총 갯수
	private int limit;			//한페이지당 몇개의 게시글을 불러올 것인지
	private int startpage;		//시작될 페이지
	private int endpage;		//마지막 페이지
	private int totalpage;		//총페이지의수
	private int startrow;		//db를 통해 몇번게시글부터 불러올것인지
	private int endrow;			//db를통해 몇번 게시글까지 불러올 것인지
	private int pagelimit;
	
	public Page() {}
	
	public Page(int currentpage, int listcount, int limit, int startpage, int endpage, int totalpage, int startrow,
			int endrow, int pagelimit) {
		super();
		this.currentpage = currentpage;
		this.listcount = listcount;
		this.limit = limit;
		this.startpage = startpage;
		this.endpage = endpage;
		this.totalpage = totalpage;
		this.startrow = startrow;
		this.endrow = endrow;
		this.pagelimit = pagelimit;
	}

	public void paging(int currentpage, int listcount, int limit, int pagelimit) {
		this.currentpage = currentpage;
		this.listcount = listcount;
		this.limit = limit;
		this.totalpage = (int)((double)listcount-1)/limit + 1;
		this.startpage = ((this.currentpage-1)/pagelimit)*pagelimit+1;
		this.endpage = this.startpage + pagelimit - 1;
			if(this.endpage>this.totalpage)
				this.endpage=this.totalpage;
		this.startrow = (currentpage-1) * limit + 1;
		this.endrow = this.startrow + limit -1;
		this.pagelimit = pagelimit;
	}

	public int getCurrentpage() {
		return currentpage;
	}

	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}

	public int getListcount() {
		return listcount;
	}

	public void setListcount(int listcount) {
		this.listcount = listcount;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getStartpage() {
		return startpage;
	}

	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}

	public int getEndpage() {
		return endpage;
	}

	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}

	public int getTotalpage() {
		return totalpage;
	}

	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}

	public int getStartrow() {
		return startrow;
	}

	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}

	public int getEndrow() {
		return endrow;
	}

	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}

	public int getPagelimit() {
		return pagelimit;
	}

	public void setPagelimit(int pagelimit) {
		this.pagelimit = pagelimit;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Page [currentpage=" + currentpage + ", listcount=" + listcount + ", limit=" + limit + ", startpage="
				+ startpage + ", endpage=" + endpage + ", totalpage=" + totalpage + ", startrow=" + startrow
				+ ", endrow=" + endrow + ", pagelimit=" + pagelimit + "]";
	}

	
}
