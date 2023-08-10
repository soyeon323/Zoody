$(document).ready(function() {
    $("#uploadForm").submit(function(e) {
        e.preventDefault();

        // var formData = $(this).serialize();
        var formData = new FormData($(this)[0]);

        console.log(formData);

        const selectScope =  $("#select-scope option:selected").val();

        console.log(selectScope);

        console.log(root+"/document/upload");
        
        // formData.append("memberNo", headerGetLoginMemberNo); // 추가
        $.ajax({
            url: root+"/document/upload",
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
            console.log(response); // 성공 시 서버 응답을 출력
                $("#result").text("성공"); // 업로드 성공 시 결과를 화면에 출력
                console.log(response);

                // JSON 데이터를 파싱하여 필요한 데이터 추출
                // const responseData = JSON.parse(response);
                const getScope = response.scope;
                const getExtension = response.extension;
                const getFileName = response.fileName;
                const getName = response.name;
                const getEnrollDate = response.enrollDate;
                const getNo = response.no;

                $(".list-table > tbody").prepend(`
                <tr>
                    <td>${ getScope }</td>
                    <td>${ getExtension }</td>
                    <td>${ getFileName }</td>
                    <td>${ getName }</td> 
                    <td>${ getEnrollDate }</td>
                    <td style="display: none;">${ getNo }</td>
                </tr>
                `);
            },
            error: function(xhr, status, error) {
                console.log(xhr.responseText); // 실패 시 서버 응답을 출력
                $("#result").text("파일 업로드 실패: " + error); // 업로드 실패 시 에러 메시지를 화면에 출력
            }
        });
    });

    $("#select-scope").on("change", function() {
            $("#select-scope option:first-child").hide();
       
    });

    $("#select-directory").on("change", function() {
            $("#select-directory option:first-child").hide();
       
    });

});