
import Ruby.List as R

sample_cycle = ([1, 2, 3]#R.cycle) 3 $ \n -> do
  putStr "n: "
  print n

sample_each = [1, 2, 3]#R.each $ \n -> do
  print n

sample_include1 = ([1, 2, 3]#R.include) 3
sample_include2 = ([1, 2, 3]#R.include) 4

sample_inject = ([1, 2, 3]#R.inject) 0 $ (\acc x -> acc + x)
