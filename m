Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BAA467ECF
	for <lists+nouveau@lfdr.de>; Fri,  3 Dec 2021 21:30:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518846F990;
	Fri,  3 Dec 2021 20:30:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mta-p7.oit.umn.edu (mta-p7.oit.umn.edu [134.84.196.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76BF96E5C0
 for <nouveau@lists.freedesktop.org>; Wed,  1 Dec 2021 15:46:29 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p7.oit.umn.edu (Postfix) with ESMTP id 4J43NP1GPnz9w2y0
 for <nouveau@lists.freedesktop.org>; Wed,  1 Dec 2021 15:46:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4QR0M_X7RR07 for <nouveau@lists.freedesktop.org>;
 Wed,  1 Dec 2021 09:46:29 -0600 (CST)
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 4J43NN6K1Cz9w2xy
 for <nouveau@lists.freedesktop.org>; Wed,  1 Dec 2021 09:46:28 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 4J43NN6K1Cz9w2xy
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4J43NN6K1Cz9w2xy
Received: by mail-pf1-f197.google.com with SMTP id
 c131-20020a621c89000000b004a343484969so15383350pfc.3
 for <nouveau@lists.freedesktop.org>; Wed, 01 Dec 2021 07:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j9Nr51s8c+BNl5wfym5W4j50QPfmoIbsoX7lEYb7NO0=;
 b=hP54uOcAmEh8MaVfUzwmRsDFY2HD2rcZO3WGs28smCqTHW7LRClfCaHFOR0hRYxUfY
 7/zRxZ4eYQFeucFfvEB6q4ZcneYRseHvkCnbLsO6u1G4FsxLDg8zuMMK6ewW+qdzPWth
 UHJ6Ni6dZ8BncvQcacc23wg6SCavkH2ppNsDImdLk/GYTOkFm3UZzGkWBGBnVDGDYzgQ
 s8btnpP1BnuhNHsQzSFX/VAPM3xfhMy1tkQzHa8x9d1P8PdeXEPtF5Qk1Y+FN+gwNfk+
 5oMorQ4lM3U+r4NwmaUSVOK8V4z/wc6cj5ym3SnHzOSCWzapzfBDeq2Hedzyjtp6XSLl
 EVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j9Nr51s8c+BNl5wfym5W4j50QPfmoIbsoX7lEYb7NO0=;
 b=Ngf4OmU8L1oyOdWDqeIgAHODnOf05fueBsYpJgdRCGVm00sP4MHCD9sLvpN8IeeoBN
 sVSGJCfzuK6YIdSdCmy//H4D5b6BD0tGOSk6shnM36vamsNmDd9Zv0GZ6NPqekqrM7px
 e4CAysnc/E7ESZzjgLnToBXbI4DxWTeNZOc4Mb5PnnsoSID4iHGgZwGor+g04mp2BPjt
 /AIrZskBOkj17yF1nGDFARjrU0cD6QaeXSaqshfV9huFvdzHMbVNyt8lSQSzE7QDQ1k6
 91aaOS53j7FM/dfPd+cSVHyBK/BsPgWufYXkSAHQzsxIpnKWgX2ygn+vNGiLdZoSkpSc
 BJJA==
X-Gm-Message-State: AOAM5312UELck+TfjqmhZs79VmM1G0O2/bqUExoXwJZ9TfGIo1bwLPAx
 Hy8uTFAvs/6Vl5LroWmRzpW8qlxFBklG4HbhN2EawLrM3v5UhiJ9rmOCQSs9o3Y/SAiCM5wGd2t
 7aBuhUsE6yGesVFz3zz5PepDwEDgKTQ==
X-Received: by 2002:a17:90b:4a0f:: with SMTP id
 kk15mr8370545pjb.223.1638373588190; 
 Wed, 01 Dec 2021 07:46:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4Jj3XUHz6YZqjUjnp03PD0GdE83Yhf0dfQDMWddCbTcxhLg/hZmT7i3Kv1K9nJpdhtmqEpQ==
X-Received: by 2002:a17:90b:4a0f:: with SMTP id
 kk15mr8370511pjb.223.1638373587982; 
 Wed, 01 Dec 2021 07:46:27 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.22])
 by smtp.gmail.com with ESMTPSA id l13sm213390pfu.149.2021.12.01.07.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 07:46:27 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Date: Wed,  1 Dec 2021 23:45:48 +0800
Message-Id: <20211201154550.186374-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 03 Dec 2021 20:30:00 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/dispnv04: Fix a NULL pointer
 dereference in nv17_tv_get_ld_modes()
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 kjlu@umn.edu, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

In nv17_tv_get_ld_modes(), drm_mode_duplicate() is assigned to mode
and there is a dereference of it in nv17_tv_get_ld_modes(). which could
lead to a NULL pointer dereference on failure of
drm_mode_duplicate().

Fix this bug by adding a check of mode.

As the return value of .get_modes() can not be negative, this patch
does not directly return error code, but uses NV_INFO to report and
returns n.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_DRM_NOUVEAU=m show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: f24342375927 ("drm/nouveau: Break some long lines in the TV-out code.")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
index 6fe103fd60e9..598180a403ab 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
@@ -208,6 +208,11 @@ static int nv17_tv_get_ld_modes(struct drm_encoder *encoder,
 		struct drm_display_mode *mode;

 		mode = drm_mode_duplicate(encoder->dev, tv_mode);
+		if (!mode) {
+			NV_INFO(nouveau_drm(encoder->dev),
+				"failure in drm_mode_duplicate\n");
+			return n;
+		}

 		mode->clock = tv_norm->tv_enc_mode.vrefresh *
 			mode->htotal / 1000 *
-- 
2.25.1

