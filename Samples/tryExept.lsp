
(try   (prog (x y) (setq x 12) (setq  y 6) (return (try (/ x y) except (prog nil (say 'err-1) (return 'err-1)))))
except  (prog nil (say 'err-0) (return 'err-0)))

(try (prog (x y) (setq x 12) (setq  y 0) (return (try (/ x y) except (prog nil (say 'err-1) (return 'err-1)))))
except (prog nil (say 'err-0) (return 'err-0)))

(try (prog (x y) (setq x 12) (setq  T 6) (return (try (/ x t) except (prog nil (say 'err-1) (return 'err-1)))))
except (prog nil (say 'err-0) (return 'err-0)))

