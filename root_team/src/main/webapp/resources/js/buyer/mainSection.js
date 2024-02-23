function mainSection() {
    const mainBanner = document.querySelector(".main_banner");
    const mainBannerImgCount = document.querySelector(".main_banner_img_count");
    const mainBannerImgs = document.querySelector('.main_banner_imgs');
    const mainBannerClass = ['prev_prev_perv', 'prev_prev', 'prev', 'view', 'next', 'next_next',
        'next_next_next'
    ];
    const mainBannerBtns = document.querySelectorAll(".main_banner_btns button");
    const mainImgCount = mainBannerImgs.childElementCount;
    let mainImgNum = 1;
    let intervalId;

    resumeInterval();
    mainBanner.addEventListener("mouseover", pauseInterval);
    mainBanner.addEventListener("mouseout", resumeInterval);
 
    function pauseInterval() {
        clearInterval(intervalId);
    }

    function resumeInterval() {
        intervalId = setInterval(() => {
            handleImageChange(1);
        }, 5000);
    }

    mainBannerBtns.forEach(mbb => {
        mbb.addEventListener("click", () => {
            let isButtonClicked = false;
            if (!isButtonClicked) {
                isButtonClicked = true;
                mbb.disabled = true;
                setTimeout(() => {
                    isButtonClicked = false;
                    mbb.disabled = false;
                }, 500);
            }
            if (mbb.classList.contains("main_banner_prev")) {
                handleImageChange(-1);
            } else if (mbb.classList.contains("main_banner_next")) {
                handleImageChange(1);
            } else if (mbb.classList.contains("main_banner_next_next")) {
                handleImageChange(1);
                handleImageChange(1);
            }
        });
    });

    function handleImageChange(direction) {
        mainBannerClass.forEach(thisClass => {
            changeImage(thisClass, direction);
        });
        mainImgNum = (mainImgNum + direction - 1 + mainImgCount) % mainImgCount + 1;
        const bgPosition = `${100 - 5.26325 * (mainImgNum - 1)}% 50%`;
        mainBannerImgCount.style.backgroundPosition = bgPosition;
    }

    function changeImage(thisClass, direction) {
        let thisImg = document.querySelector(`.${thisClass}`);
        thisImg.classList.remove(`${thisClass}`);

        let newImg;
        if (direction === 1) {
            newImg = thisImg.nextElementSibling || mainBannerImgs.firstElementChild;
        } else {
            newImg = thisImg.previousElementSibling || mainBannerImgs.lastElementChild;
        }

        newImg.classList.add(`${thisClass}`);
    }

    //-----------------------------------------------------------------------------------------------------------

        const gallery = document.querySelectorAll('.gallery');

        function handleScroll() {
            const scrollPosition = window.scrollY;
            gallery.forEach(g => {
                const galleryPosition = g.offsetTop - window.innerHeight + 100;

                if (scrollPosition > galleryPosition) {
                    g.classList.add('active');
                } else {
                    g.classList.remove('active');
                }
            })
        }

        gallery.forEach(g => {
            const galleryBtn = g.parentNode.querySelectorAll('.gallery_btns button');
            const galleryPrev = g.parentNode.querySelector('.prev');
            const galleryNext = g.parentNode.querySelector('.next');
            const galleryCnt = g.childElementCount;
            const gStyle = window.getComputedStyle(g);
            const gBoxStyle = window.getComputedStyle(g.parentNode);
            let gBoxWidth = parseInt(gBoxStyle.getPropertyValue("width"));
            let galleryNum = 0;

            g.addEventListener('mouseover', galleryBtnHide)

            window.addEventListener('resize', function () {
                gBoxWidth = parseInt(gBoxStyle.getPropertyValue("width"));
                galleryNum = 0;
                g.style.transform = `translateX(-${galleryNum*400}px)`;
            });

            galleryBtn.forEach(btn => {
                btn.addEventListener('click', () => {
                    let isButtonClicked = false;
                    if (!isButtonClicked) {
                        isButtonClicked = true;
                        btn.disabled = true;
                        setTimeout(() => {
                            isButtonClicked = false;
                            btn.disabled = false;
                        }, 500);
                    }
                })
            })
            galleryPrev.addEventListener('click', () => {
                if (galleryNum > 0) {
                    galleryNum--
                    g.style.transform = `translateX(-${galleryNum*400}px)`;
                }
                galleryBtnHide();
            })

            galleryNext.addEventListener('click', () => {
                if (((galleryNum * 400) + gBoxWidth) <
                    parseInt(gStyle.getPropertyValue("width"))) {
                    galleryNum++
                    g.style.transform = `translateX(-${galleryNum*400}px)`;
                }
                galleryBtnHide();
            })

            function galleryBtnHide() {
                if (galleryNum === 0) {
                    galleryPrev.classList.remove('active');
                } else {
                    galleryPrev.classList.add('active');
                }
                if (((galleryNum * 400) + gBoxWidth) >
                    parseInt(gStyle.getPropertyValue("width"))) {
                    galleryNext.classList.remove('active');
                } else {
                    galleryNext.classList.add('active');
                }
            }
        });
        window.addEventListener('scroll', handleScroll);
        
}