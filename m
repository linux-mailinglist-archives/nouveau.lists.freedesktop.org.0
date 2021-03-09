Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FCD331BFB
	for <lists+nouveau@lfdr.de>; Tue,  9 Mar 2021 02:02:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1486E420;
	Tue,  9 Mar 2021 01:02:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C716E420
 for <nouveau@lists.freedesktop.org>; Tue,  9 Mar 2021 01:02:04 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id w60so4197883qte.0
 for <nouveau@lists.freedesktop.org>; Mon, 08 Mar 2021 17:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/tcua8JEh20I7qSkX1+7PRmxJ8LW5jyV4ca6Nk6BFCU=;
 b=VLDt80ym8VZBCec32PaS17NiIbK8ONM/dgzWVOklmG/O/RnBGbgvN8QkYeytdz0WmK
 mdlvOcnvoWC9fN9VjqQzBKF5M/4h9CYAogd6EjMfUS+9rzic46kluqD1BXqiNKweOaIi
 SNiXf5TchzBKuRoY4hUl7hXKquBTuAebryxpMMqiFWOuoY6G1lJUszzf1p5DtHRAlDq1
 j9geWM2uFf27F/u03vqBaRW/MrVvZjD0kZrtvcoNnoYIooeF6d3gb4MVX7FFegbmd9U5
 vErJ2BbT2Dr+HGF3GBNHzOV2XTK8LLuz9/je3WKS/5+D5k3Xqqb/HiynUKXReozlIPMy
 ieRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/tcua8JEh20I7qSkX1+7PRmxJ8LW5jyV4ca6Nk6BFCU=;
 b=HiDvBsRR6qRQ03afiHoOkHeAfjZN13T8BOwWLMP3FnAEJexYOAKFWlDsnIVS7KOrWF
 pZdg5WhUuX5j5enXZOVIoM9EcgR8G3VSsrGJGx8yXMAyS6ayHuQeuWvIhUEbC12SodPY
 cHXIeYQSCg67y1Mi4SnXkOP+wKLKQRXqbj4vUmnvB3B8yQHvaRru1NJnjNOXvTAb88Zq
 uV5aahmvVz2891ZvvzfgzMQTjrJ65+vAr1qlj5qXpmhOagncvMuOjPAqL+mvIRDLBKo/
 WB0TKLY6JQLQPzPGssf4nNs7tukPpNnLZO13ZJyAUVF+RChEGwqYvgOTN+1kd7iv5bDe
 1C3g==
X-Gm-Message-State: AOAM5315y07qGZ5hikUK1RjnyCfE55jtgbiVF0dsd3vw6uiwMI4rdIVq
 Cq3l8NQxb8Mb7deSEHDJMUEIOlcWCx+uLw==
X-Google-Smtp-Source: ABdhPJzEnFKABf+1theh4zUyf9ouFgIBXbRkNEcq4v6vhaT1nr2UMbdu8DR/l1DYP77gZeAKz5Y5Ug==
X-Received: by 2002:ac8:5ac8:: with SMTP id d8mr22164426qtd.354.1615251723421; 
 Mon, 08 Mar 2021 17:02:03 -0800 (PST)
Received: from athos.hellosponsor.com ([70.19.70.200])
 by smtp.gmail.com with ESMTPSA id o89sm9181772qte.84.2021.03.08.17.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 17:02:02 -0800 (PST)
From: Ilia Mirkin <imirkin@alum.mit.edu>
To: nouveau@lists.freedesktop.org
Date: Mon,  8 Mar 2021 20:02:01 -0500
Message-Id: <20210309010201.29230-1-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [Nouveau] [PATCH] xv: add MMX / SSE acceleration for YV12 -> YUYV
 repacking
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This is used by the blit adaptor. Might as well try to accelerate it.
When testing with it hacked to take effect for nvc0, saw, a decrease of
NVPutImage usage in the X process from 68% -> 43% (MMX) -> 24% (SSE)
(which is approximately a 7x speed-up to the function, assuming other
parts remained equal).

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

I did some basic testing with a patch to force the texture path to do
this conversion rather than to NV12, testing all 3 cases. However I need
to do better testing of edge cases, which I will do before pushing.

 src/nouveau_xv.c | 94 ++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 80 insertions(+), 14 deletions(-)

diff --git a/src/nouveau_xv.c b/src/nouveau_xv.c
index b2d75c5..16aca93 100644
--- a/src/nouveau_xv.c
+++ b/src/nouveau_xv.c
@@ -25,7 +25,7 @@
 #include "config.h"
 #endif
 
-#ifdef __SSE2__
+#if defined(__SSE2__) || defined(__MMX__)
 #include <immintrin.h>
 #endif
 
@@ -568,7 +568,7 @@ NVCopyData420(unsigned char *src1, unsigned char *src2, unsigned char *src3,
 {
 	CARD32 *dst;
 	CARD8 *s1, *s2, *s3;
-	int i, j;
+	int i, j, l, e;
 
 #define su(X) (((j & 1) && j < (h-1)) ? ((unsigned)((signed int)s2[X] +        \
 		(signed int)(s2 + srcPitch2)[X]) / 2) : (s2[X]))
@@ -576,29 +576,95 @@ NVCopyData420(unsigned char *src1, unsigned char *src2, unsigned char *src3,
 		(signed int)(s3 + srcPitch2)[X]) / 2) : (s3[X]))
 
 	w >>= 1;
+#ifdef __MMX__
+	l = w >> 3;
+	e = w & 7;
+#else
+	l = w >> 2;
+	e = w & 3;
+#endif
 
 	for (j = 0; j < h; j++) {
 		dst = (CARD32*)dst1;
 		s1 = src1;  s2 = src2;  s3 = src3;
 		i = w;
 
-		while (i > 4) {
+		for (i = 0; i < l; i++) {
+#ifdef __MMX__
+			__m64 mm_v = *(__m64 *)&s2[0];
+			__m64 mm_u = *(__m64 *)&s3[0];
+
+			if (j & 1 && j < (h - 1)) {
+				__m64 mm_vnext = *(__m64 *)&(s2 + srcPitch2)[0];
+#ifdef __SSE__
+				mm_v = _mm_avg_pu8(mm_v, mm_vnext);
+#else /* __SSE__ */
+				__m64 zero = _m_from_int(0);
+				/* make 16-bit wide values */
+				__m64 mm_vnext16_1 = _mm_unpacklo_pi8(mm_vnext, zero);
+				__m64 mm_vnext16_2 = _mm_unpackhi_pi8(mm_vnext, zero);
+				__m64 mm_v16_1 = _mm_unpacklo_pi8(mm_v, zero);
+				__m64 mm_v16_2 = _mm_unpackhi_pi8(mm_v, zero);
+				/* add together */
+				mm_v16_1 = _mm_add_pi16(mm_v16_1, mm_vnext16_1);
+				mm_v16_2 = _mm_add_pi16(mm_v16_2, mm_vnext16_2);
+				/* divide by 2 */
+				mm_v16_1 = _mm_srli_pi16(mm_v16_1, 1);
+				mm_v16_2 = _mm_srli_pi16(mm_v16_2, 1);
+				/* put back into 8-bit values */
+				mm_v = _mm_packs_pu16(mm_v16_1, mm_v16_2);
+#endif
+
+				/* repeat for u */
+				__m64 mm_unext = *(__m64 *)&(s3 + srcPitch2)[0];
+#ifdef __SSE__
+				mm_u = _mm_avg_pu8(mm_u, mm_unext);
+#else /* __SSE__ */
+				/* make 16-bit wide values */
+				__m64 mm_unext16_1 = _mm_unpacklo_pi8(mm_unext, zero);
+				__m64 mm_unext16_2 = _mm_unpackhi_pi8(mm_unext, zero);
+				__m64 mm_u16_1 = _mm_unpacklo_pi8(mm_u, zero);
+				__m64 mm_u16_2 = _mm_unpackhi_pi8(mm_u, zero);
+				/* add together */
+				mm_u16_1 = _mm_add_pi16(mm_u16_1, mm_unext16_1);
+				mm_u16_2 = _mm_add_pi16(mm_u16_2, mm_unext16_2);
+				/* divide by 2 */
+				mm_u16_1 = _mm_srli_pi16(mm_u16_1, 1);
+				mm_u16_2 = _mm_srli_pi16(mm_u16_2, 1);
+				/* put back into 8-bit values */
+				mm_u = _mm_packs_pu16(mm_u16_1, mm_u16_2);
+#endif
+			}
+
+			__m64 mm_y1 = *(__m64 *)s1;
+			__m64 mm_y2 = *(__m64 *)&s1[8];
+
+			__m64 mm_uv1 = _mm_unpacklo_pi8(mm_u, mm_v);
+			__m64 mm_uv2 = _mm_unpackhi_pi8(mm_u, mm_v);
+
+			*(__m64 *)&dst[0] = _mm_unpacklo_pi8(mm_y1, mm_uv1);
+			*(__m64 *)&dst[2] = _mm_unpackhi_pi8(mm_y1, mm_uv1);
+			*(__m64 *)&dst[4] = _mm_unpacklo_pi8(mm_y2, mm_uv2);
+			*(__m64 *)&dst[6] = _mm_unpackhi_pi8(mm_y2, mm_uv2);
+
+			dst += 8; s2 += 8; s3 += 8; s1 += 16;
+#else /* __MMX__ */
 #if X_BYTE_ORDER == X_BIG_ENDIAN
-		dst[0] = (s1[0] << 24) | (s1[1] << 8) | (sv(0) << 16) | su(0);
-		dst[1] = (s1[2] << 24) | (s1[3] << 8) | (sv(1) << 16) | su(1);
-		dst[2] = (s1[4] << 24) | (s1[5] << 8) | (sv(2) << 16) | su(2);
-		dst[3] = (s1[6] << 24) | (s1[7] << 8) | (sv(3) << 16) | su(3);
+			dst[0] = (s1[0] << 24) | (s1[1] << 8) | (sv(0) << 16) | su(0);
+			dst[1] = (s1[2] << 24) | (s1[3] << 8) | (sv(1) << 16) | su(1);
+			dst[2] = (s1[4] << 24) | (s1[5] << 8) | (sv(2) << 16) | su(2);
+			dst[3] = (s1[6] << 24) | (s1[7] << 8) | (sv(3) << 16) | su(3);
 #else
-		dst[0] = s1[0] | (s1[1] << 16) | (sv(0) << 8) | (su(0) << 24);
-		dst[1] = s1[2] | (s1[3] << 16) | (sv(1) << 8) | (su(1) << 24);
-		dst[2] = s1[4] | (s1[5] << 16) | (sv(2) << 8) | (su(2) << 24);
-		dst[3] = s1[6] | (s1[7] << 16) | (sv(3) << 8) | (su(3) << 24);
+			dst[0] = s1[0] | (s1[1] << 16) | (sv(0) << 8) | (su(0) << 24);
+			dst[1] = s1[2] | (s1[3] << 16) | (sv(1) << 8) | (su(1) << 24);
+			dst[2] = s1[4] | (s1[5] << 16) | (sv(2) << 8) | (su(2) << 24);
+			dst[3] = s1[6] | (s1[7] << 16) | (sv(3) << 8) | (su(3) << 24);
 #endif
-		dst += 4; s2 += 4; s3 += 4; s1 += 8;
-		i -= 4;
+			dst += 4; s2 += 4; s3 += 4; s1 += 8;
+#endif /* __MMX__ */
 		}
 
-		while (i--) {
+		for (i = 0; i < e; i++) {
 #if X_BYTE_ORDER == X_BIG_ENDIAN
 		dst[0] = (s1[0] << 24) | (s1[1] << 8) | (sv(0) << 16) | su(0);
 #else
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
