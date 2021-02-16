# How to reproduce issue

1. Install vim-plug:
    ```
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    ```

2. launch nvim: 
    ```
    nvim
    ```

3. Toggle fern into the screen:
    ```
    :Fern . -drawer -toggle
    ```

4. Make session that will error:
    ```
    :mksession fern_opened.vim
    ```

5. Makes session that will not error:
    ```
    :Fern . -drawer -toggle
    ```
    ```
    :mksession fern_closed.vim
    ```

6. Close nvim: 
    ```
    :q
    ```

7. Open nvim:
    ```
    nvim
    ```

8. Load session that won't show error:
    ```
    :source fern_closed.vim
    ```

9. Load session that will error:
    ```
    :source fern_opened.vim
    ```
