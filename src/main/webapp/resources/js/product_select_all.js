$(function() {
			$('#searchBtn').click(
				function() {
					var path = '?page=1&perPageNum=8';
					self.location = "ProductSelect"
						+ path
						+ "&searchType="
						+ $("select option:selected").val()
						+ "&keyword="
						+ encodeURIComponent($('#keywordInput').val());
				});
		});