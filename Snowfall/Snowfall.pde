Snow[] snows = new Snow[120]; //雪の数
float gravity = 0.05; //落ちる速さ

void setup(){
  size(400,300); //画面の大きさ
  noStroke(); //縁取りをしない
  //雪をひとつづつ作って配列に入れる
  for(int i = 0; i < snows.length; i++){
    float x = random(width); //横の場所ランダム
    float y = random(-height,height); //縦の場所
    float size = random(5,12); //雪の大きさ
    float spd = map( size, 5, 15, 0.5, 2.0); //落ちる速さ
    snows[i] = new Snow(x, y,spd ,size ); //できた雪をいれる
  }
}

void draw() {
  background(20,20,50);//夜空っぽい背景
  
  
  //雪の動作
  for(int i = 0; i < snows.length; i++){
    snows[i].move(); //下に落ちるようにする
    snows[i].display(); //白色に光るように描く
  }
}

//Snowクラス
class Snow {
   float x,y; //雪の場所
    float vy; //下に進む速さ
    float size; //雪の大きさ
    float twinkleSpeed; //きらきらするはやさ
    float brightness; //光の明るさ
    
    //雪を作るときに最初に一回だけ動く
    Snow(float x_, float y_, float vy_, float size_){
       x = x_;
       y = y_;
       vy = vy_; //初めの速さ
       size = size_;
       brightness = random(150,255); //光の強さランダム
       twinkleSpeed = random(0.02,0.05); //キラキラの速さランダム
     }
     //雪を動かす
     void move() {
       y += vy; //下におちる
       //明るさをふわふわ変化（点滅）
       brightness += sin(frameCount * twinkleSpeed) * 2;
       
       //下に出たら上へ戻す
       if (y > height +10){
         y = random(-50,-10); //少し上に戻す
         x = random(width); //横の場所ランダム
         brightness = random(150,255); //初めの速さも入れなおす
       }
     }
     
     //雪を描く
     void display() {
       //グラデーションぽくふんわり光らせる
       for (int r = 0; r< 3; r++) { //うすい光→中くらいの光→強い光の順で重ねる
       //明るさから少しずつ引いて外ほどうすく
         float alpha = 50;
         fill(250, 250, 190, alpha *0.8);
         ellipse(x, y, size +r *3, size + r * 3);
       }
     }
}
         
