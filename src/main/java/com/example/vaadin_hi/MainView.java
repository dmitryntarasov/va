package com.example.vaadin_hi;

import com.vaadin.flow.component.Text;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.textfield.TextArea;
import com.vaadin.flow.router.Route;
import com.vaadin.flow.server.PWA;

@Route("hi")
public class MainView extends VerticalLayout {

    private final TextArea inputTextArea = new TextArea("Введите текст");
    private final TextArea outputTextArea = new TextArea("Результат");

    public MainView() {
        // Настройка компонентов
        inputTextArea.setWidth("50%");
        outputTextArea.setWidth("50%");
        outputTextArea.setReadOnly(true);

        // Обработчик изменений
        inputTextArea.addValueChangeListener(e -> {
            String originalText = e.getValue();
            outputTextArea.setValue(originalText.toUpperCase());
        });

        // Компоновка
        setAlignItems(Alignment.CENTER);
        add(
                new Text("Конвертер в верхний регистр"),
                inputTextArea,
                outputTextArea
        );
    }
}
