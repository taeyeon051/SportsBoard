const log = console.log;

window.onload = () => {
    const main = new Main();
}

class Main {
    constructor() {
        this.mainBoard = document.querySelector("#photo");
        
        this.init();
    }

    init() {

        this.mainImgRender();
    }

    mainImgRender() {
        const { mainBoard } = this;
    	const img = mainBoard.querySelector("img");
    	img.style = "";
    	img.width = "";
    	const text = mainBoard.querySelector(".text");
    	mainBoard.innerHTML = "";
    	mainBoard.append(img);
    	mainBoard.append(text);
    	mainBoard.style.display = 'block';
    }
}