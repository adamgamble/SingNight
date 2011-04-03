include Java
import java.awt.Color
import java.awt.image.BufferedImage
import javax.swing.JFrame
import javax.swing.ImageIcon
import javax.swing.JPanel
import javax.swing.JLabel
import java.awt.Toolkit

class Example < JFrame
  attr_accessor :panel


    def initialize
        super "Simple"
        self.initUI
    end

    def initUI
        @panel = JPanel.new
        @panel.setLayout nil
        @panel.setBackground Color.new 66, 66, 66
        self.getContentPane.add @panel
        self.setDefaultCloseOperation JFrame::EXIT_ON_CLOSE
        self.setSize 1024, 768
        self.setLocationRelativeTo nil
        #self.setExtendedState(JFrame::MAXIMIZED_BOTH)
        self.setUndecorated true
        self.setVisible true
    end

    def show_image image
        @panel.removeAll
        image = ImageIcon.new image.path

        img = image.getImage

        img = img.getScaledInstance(1024, 768,  java.awt.Image::SCALE_SMOOTH)

        image = ImageIcon.new(img)

        image_label = JLabel.new image
        image_label.setBounds 0, 0, 1024, 768
        @panel.add image_label
        self.repaint
    end
end
