# -*- coding:utf-8 -*-
class Solution:
    def movingCount(self, threshold, rows, cols):
        # write code here
        def _isUnderThreshold(i, j):
            return sum(int(z) for z in str(i)) + sum(int(z) for z in str(j)) <= threshold
        directions = ((0, 1), (0, -1), (1, 0), (-1, 0))
        walked = set([(0, 0)])
        queue = [(0, 0)]
        while queue != []:
            i, j = queue.pop()
            for bI, bJ in directions:
                nI, nJ = i + bI, j + bJ
                if (nI, nJ) not in walked and 0 <= nI < rows and 0 <= nJ < cols and _isUnderThreshold(nI, nJ):
                    walked.add((nI, nJ))
                    queue.insert(0, (nI, nJ))
        print(walked)
        return len(walked)

s = Solution()
print(s.movingCount(5, 10, 10))