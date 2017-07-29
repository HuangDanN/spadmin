package com.yirong.framework.common.captcha;

import com.octo.captcha.component.image.backgroundgenerator.BackgroundGenerator;
import com.octo.captcha.component.image.backgroundgenerator.UniColorBackgroundGenerator;
import com.octo.captcha.component.image.color.RandomListColorGenerator;
import com.octo.captcha.component.image.deformation.ImageDeformation;
import com.octo.captcha.component.image.deformation.ImageDeformationByFilters;
import com.octo.captcha.component.image.fontgenerator.FontGenerator;
import com.octo.captcha.component.image.fontgenerator.RandomFontGenerator;
import com.octo.captcha.component.image.textpaster.DecoratedRandomTextPaster;
import com.octo.captcha.component.image.textpaster.TextPaster;
import com.octo.captcha.component.image.textpaster.textdecorator.TextDecorator;
import com.octo.captcha.component.image.wordtoimage.DeformedComposedWordToImage;
import com.octo.captcha.component.image.wordtoimage.WordToImage;
import com.octo.captcha.component.word.wordgenerator.RandomWordGenerator;
import com.octo.captcha.engine.image.ListImageCaptchaEngine;
import com.octo.captcha.image.gimpy.GimpyFactory;

import java.awt.*;
import java.awt.image.ImageFilter;

/**
 * @author xn-h
 * @describe(验证码引擎类)
 * @create 2017/7/26
 **/
public class CustomCaptchaEngine extends ListImageCaptchaEngine {


	@Override
	protected void buildInitialFactories() {
		int minWordLength = 4;
		int maxWordLength = 5;
		int fontSize = 22;
		int imageWidth = 80;
		int imageHeight = 40;

		//字母生成器
//        WordGenerator dictionnaryWords = new ComposeDictionaryWordGenerator(new FileDictionary("toddlist"));
		RandomWordGenerator wordgen = new RandomWordGenerator("0123456789");

		//把字母转成图片 处理器
		TextPaster randomPaster = new DecoratedRandomTextPaster(minWordLength, maxWordLength, new RandomListColorGenerator(new Color[] { new Color(23, 170, 27), new Color(220, 34, 11), new Color(23, 67, 172) }), new TextDecorator[] {});
		//渐变
		//BackgroundGenerator background = new GradientBackgroundGenerator(imageWidth, imageHeight, Color.GRAY, Color.CYAN);

		BackgroundGenerator background = new UniColorBackgroundGenerator(imageWidth, imageHeight, Color.white);

		FontGenerator font = new RandomFontGenerator(fontSize, fontSize, new Font[] {new Font("Credit valley", Font.BOLD, fontSize) });// new Font("nyala", Font.BOLD, fontSize), new Font("Bell MT", Font.PLAIN, fontSize),

		ImageDeformation postDef = new ImageDeformationByFilters(new ImageFilter[] {});
		ImageDeformation backDef = new ImageDeformationByFilters(new ImageFilter[] {});
		ImageDeformation textDef = new ImageDeformationByFilters(new ImageFilter[] {});

		WordToImage word2image = new DeformedComposedWordToImage(font, background, randomPaster, backDef, textDef, postDef);
		addFactory(new GimpyFactory(wordgen, word2image));
	}
}
