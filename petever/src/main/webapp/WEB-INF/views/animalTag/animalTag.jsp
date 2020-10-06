<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tag.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&family=Sunflower:wght@500&display=swap" rel="stylesheet">
    <script>
        $(function () {
            $("[name=color]").change(function () {
                var $color = $(this);
                console.log($color.val());


                var realColor;
                if ($color.val() == 'green') {
	                $("#ani-info-tag1").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/animalTag_green1.png)');
	                $("#ani-info-tag2").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/animalTag_green1.png)');
                    realColor = '#659976';
                } else if ($color.val() == 'blue') {
	                $("#ani-info-tag1").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/animalTag_blue1.png)');
	                $("#ani-info-tag2").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/animalTag_blue1.png)');
                    realColor = '#006699';
                } else if ($color.val() == 'ivory') {
	                $("#ani-info-tag1").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/animalTag_beige1.png)');
	                $("#ani-info-tag2").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/animalTag_beige1.png)');
                    realColor = '#EBE7DD';
                } else if ($color.val() == 'pink') {
	                $("#ani-info-tag1").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/animalTag_pink1.png)');
	                $("#ani-info-tag2").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/animalTag_pink1.png)');
                    realColor = '#D35F5F';
                } else if ($color.val() == 'brown') {
	                $("#ani-info-tag1").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/animalTag_brown.png)');
	                $("#ani-info-tag2").css('background-image', 'url(${pageContext.request.contextPath}/resources/images/animalTag_brown.png)');
                    realColor = '#CB9661';
                }


               // $("#ani-info-tag1").css('background-color', realColor);
               // $("#ani-info-tag2").css('background-color', realColor);

            });

            $("[name=font]").change(function () {
                var $font = $(this);
                //console.log($font.val());
                $(".animal-tag-font").attr('style', 'font-family : '+ $font.val() +'!important');
            });
            //동물이름
            $("#ani-name").keyup(function () {
                var $aniName = $(this);
                // console.log($aniName.val());
                $("#preview-name").text($aniName.val());
            });
            //동물생년월일
            $("#ani-birth").change(function () {
                var $aniBirth = $(this);
                // console.log($aniBirth.val());
                $("#preview-birth").text($aniBirth.val());
            });
            //동물성별
            $("[name=aniGender]").click(function () {
                var $aniGender = $(this);
                // console.log($aniGender.next().text());
                $("#preview-gender").text("/ " + $aniGender.next().text());
            });
            //동물등록번호
            $("#ani-ssn").keyup(function () {
                var $aniSsn = $(this);
                // console.log($aniSsn.val());
                $("#preview-ssn").text($aniSsn.val());
            });
            //동물주인 이름
            $("#person-name").keyup(function () {
                var $personName = $(this);
                // console.log($personName.val());
                $("#preview-person-name").text($personName.val());
            });
            //동물주인 전화번호
            $("#person-phone").keyup(function () {
                var $personPhone = $(this);
                // console.log($personPhone.val());
                $("#preview-person-phone").text($personPhone.val());
            });

            //slide-wrap
            var slideWrapper = document.getElementById('slider-wrap');
            //current slideIndexition
            var slideIndex = 0;
            //items
            var slides = document.querySelectorAll('#slider-wrap ul li');
            //number of slides
            var totalSlides = slides.length;
            //get the slide width
            var sliderWidth = slideWrapper.clientWidth;
            //set width of items
            slides.forEach(function (element) {
                element.style.width = sliderWidth + 'px';
            })
            //set width to be 'x' times the number of slides
            var slider = document.querySelector('#slider-wrap ul#slider');
            slider.style.width = sliderWidth * totalSlides + 'px';

            // next, prev
            var nextBtn = document.getElementById('next');
            var prevBtn = document.getElementById('previous');
            nextBtn.addEventListener('click', function () {
                plusSlides(1);
            });
            prevBtn.addEventListener('click', function () {
                plusSlides(-1);
            });

            // hover
            slideWrapper.addEventListener('mouseover', function () {
                this.classList.add('active');
                clearInterval(autoSlider);
            });
            slideWrapper.addEventListener('mouseleave', function () {
                this.classList.remove('active');
                autoSlider = setInterval(function () {
                    plusSlides(1);
                }, 3000);
            });


            function plusSlides(n) {
                showSlides(slideIndex += n);
            }

            function currentSlides(n) {
                showSlides(slideIndex = n);
            }

            function showSlides(n) {
                slideIndex = n;
                if (slideIndex == -1) {
                    slideIndex = totalSlides - 1;
                } else if (slideIndex === totalSlides) {
                    slideIndex = 0;
                }

                slider.style.left = -(sliderWidth * slideIndex) + 'px';
                pagination();
            }

            //pagination
            slides.forEach(function () {
                var li = document.createElement('li');
                document.querySelector('#slider-pagination-wrap ul').appendChild(li);
            })

            function pagination() {
                var dots = document.querySelectorAll('#slider-pagination-wrap ul li');
                dots.forEach(function (element) {
                    element.classList.remove('active');
                });
                dots[slideIndex].classList.add('active');
            }

            pagination();
            var autoSlider = setInterval(function () {
                plusSlides(1);
            }, 3000);
            
        });

        function previewReset() {
            $(".ani-img").css('background-color', '');
            $(".ani-img-2").css('background-color', '');
            $(".animal-tag-font").css("font-family", '');
            $("#preview-name").text('');
            $("#preview-birth").text('');
            $("#preview-gender").text('');
            $("#preview-ssn").text('');
            $("#preview-person-name").text('');
            $("#preview-person-phone").text('');
        }

		

        
    </script>
    <div id="main-wrap">
        <section class="main"></section>
        <section class="content-wrap">
            <h1>입양하기</h1>
            <p>펫에버에서는 이러한 일들을 합니다.</p>
            <div class="content">
                <div class="tag-wrap">
                    <div class="animal-tag-preview">
                        <div id="ani-info-tag1">
                            <label class="animal-tag-font" id="preview-name" for=""></label><br>
                            <label class="animal-tag-font" id="preview-birth" for=""></label>
                            <label class="animal-tag-font" id="preview-gender" for=""></label><br>
                            <label class="animal-tag-font" id="preview-ssn" for=""></label><br>
                        </div>

                        <label class="preview-label preview-front" for="">앞면</label>

                        <div id="ani-info-tag2">
                            <label class="animal-tag-font" id="preview-person-name" for=""></label><br>
                            <label class="animal-tag-font" id="preview-person-phone" for=""></label><br>
                        </div>

                        <label class="preview-label preview-back" for="">뒷면</label>
                    </div>
                    <div class="animal-tag-select">
                        <form action="" method="POST">
                            <h4>색상</h4>
                            <input type="radio" name="color" id="green" value="green">
                            <label class="ani-radio" for="green">그린</label>
                            <input type="radio" name="color" id="blue" value="blue">
                            <label class="ani-radio" for="blue">블루</label>
                            <input type="radio" name="color" id="ivory" value="ivory">
                            <label class="ani-radio" for="ivory">아이보리</label>
                            <br />
                            <input type="radio" name="color" id="pink" value="pink">
                            <label class="ani-radio" for="pink">핑크</label>
                            <input type="radio" name="color" id="brown" value="brown">
                            <label class="ani-radio" for="brown">브라운</label>

                            <h4>폰트</h4>
                            <input type="radio" name="font" id="font_DoHyeon" value="Do Hyeon">
                            <label class="ani-radio font_DoHyeon" for="font_DoHyeon">도현체</label>
                            <input type="radio" name="font" id="font_Jua" value="Jua">
                            <label class="ani-radio font_Jua" for="font_Jua">주아체</label>
                            <input type="radio" name="font" id="font_Sunflower" value="Sunflower">
                            <label class="ani-radio font_Sunflower" for="font_Sunflower">선플라워체</label>
                            <br>
                            <label for="ani-name" class="ani-label">동물이름</label>
                            <input type="text" name="aniName" id="ani-name" placeholder="동물 이름">
                            <br>
                            <label for="ani-birth" class="ani-label">동물생년월일</label>
                            <input type="date" name="aniBirth" id="ani-birth">
                            <br>
                            <label for="ani-gender" class="ani-label">동물성별</label>
                            <input type="radio" name="aniGender" id="ani-gender-m">
                            <label class="ani-radio" for="ani-gender-m">수컷</label>
                            <input type="radio" name="aniGender" id="ani-gender-f">
                            <label class="ani-radio" for="ani-gender-f">암컷</label>
                            <br>
                            <label for="ani-ssn" class="ani-label">동물등록번호</label>
                            <input type="text" name="aniSsn" id="ani-ssn" placeholder="동물등록번호">
                            <br>
                            <label for="person-name" class="ani-label">보호자 이름</label>
                            <input type="text" name="personName" id="person-name" placeholder="보호자 이름">
                            <br>
                            <label for="person-phone" class="ani-label">보호자 전화번호</label>
                            <input type="text" name="personPhone" id="person-phone" placeholder="보호자 전화번호">
                            
                            <hr/>
                            
							<h4>배송지 입력</h4>
							<label for="ssg-name" class="ani-label ssg">이름</label>
                            <input type="text" name="name" id="ssg-name" placeholder="받으실분 이름">
                            <br />
							<label for="ssg-tel" class="ani-label ssg">핸드폰번호</label>
                            <input type="text" name="tel" id="ssg-tel" placeholder="받으실분 전화번호">
                            <br />
							<label for="ssg-addr" class="ani-label ssg" id="ssg-addr-label" >주소</label>
                            <input type="text" name="addr1" id="ssg-addr1" placeholder="메인 주소">
                            <button id="addr-search">주소찾기</button>
                            <input type="text" name="addr2" id="ssg-addr2" placeholder="세부 주소">
                            
							
                            
                            <input class="btn" type="submit" value="구매">
                            <input class="btn" type="reset" value="초기화" onclick="previewReset();">
                        </form>
                    </div>
                </div>
                
                <div id="slider-wrap">
				    <ul id="slider">
				        <li>
				            <div>
				                <h3>제품이미지#1</h3>
				                <span></span>
				            </div>
				            <img src="${pageContext.request.contextPath}/resources/images/tag1.jpg" alt="">
				        </li>
				
				        <li>
				            <div>
				                <h3>제품이미지#2</h3>
				                <span></span>
				            </div>
				            <img src="${pageContext.request.contextPath}/resources/images/tag2.jpg" alt="">
				        </li>
				
				        <li>
				            <div>
				                <h3>제품이미지#3</h3>
				                <span></span>
				            </div>
				            <img src="${pageContext.request.contextPath}/resources/images/tag3.jpg" alt="">
				        </li>
				        <li>
				            <div>
				                <h3>사용예시#1</h3>
				                <span></span>
				            </div>
				            <img src="${pageContext.request.contextPath}/resources/images/tag4.jpg" alt="">
				        </li>
				        <li>
				            <div>
				                <h3>사용예시#2</h3>
				                <span></span>
				            </div>
				            <img src="${pageContext.request.contextPath}/resources/images/tag5.jpg" alt="">
				        </li>
				        <li>
				            <div>
				                <h3>사용예시#3</h3>
				                <span></span>
				            </div>
				            <img src="${pageContext.request.contextPath}/resources/images/tag6.jpg" alt="">
				        </li>
				    </ul>
				
				    <div class="slider-btns" id="next"><span>▶</span></div>
				    <div class="slider-btns" id="previous"><span>◀</span></div>
				
				    <div id="slider-pagination-wrap">
				        <ul>
				        </ul>
				    </div>
				</div>
                
            </div>
        </section>
    </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>