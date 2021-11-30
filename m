Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EF1467ECE
	for <lists+nouveau@lfdr.de>; Fri,  3 Dec 2021 21:30:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F9B6F4C5;
	Fri,  3 Dec 2021 20:30:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mta-p5.oit.umn.edu (mta-p5.oit.umn.edu [134.84.196.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F1A6E84F
 for <nouveau@lists.freedesktop.org>; Tue, 30 Nov 2021 14:43:57 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4J3PrP6cJjz9yT9T
 for <nouveau@lists.freedesktop.org>; Tue, 30 Nov 2021 14:35:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rR2I0GLa7E7O for <nouveau@lists.freedesktop.org>;
 Tue, 30 Nov 2021 08:35:01 -0600 (CST)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4J3PrP4Z1pz9yT9Z
 for <nouveau@lists.freedesktop.org>; Tue, 30 Nov 2021 08:35:01 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4J3PrP4Z1pz9yT9Z
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4J3PrP4Z1pz9yT9Z
Received: by mail-pl1-f200.google.com with SMTP id
 v18-20020a170902e8d200b00141df2da949so8315470plg.10
 for <nouveau@lists.freedesktop.org>; Tue, 30 Nov 2021 06:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v45QaW2rM4Je/A8eu9T3JFXlWztdvqd9VNNeErMwc18=;
 b=ZoJ7bm62EGw7ET4F1X20dpTU7jOwszuY9Bf8pk2ZQQylLCvULZZChhV65/9zTL8s3f
 hNlp0ysjfaFVeSzUpTo+vjdJQlYwrEVHbbqCYmvLUn4A7lpiHK/SVIoJeqvFCBJANZCw
 6I/83GucUnXu7bRLNHWKTqrWxdVNTlH05T8nHO76x6idj5YKgCSOnkg1XtOhAK4mXkq6
 +1oYirp7q5sbg7cLxLAWPWzZXSS76mWWWHbZF9DneEeDnTx2Eqm+3Y/IICIODVT/HDqi
 HZ9pOp3tfkqltDdRs7fS0JlVHLh48MwjjzjjOCpVfGt44YJcYlqOEfTpUcKHaQUplA4H
 uM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v45QaW2rM4Je/A8eu9T3JFXlWztdvqd9VNNeErMwc18=;
 b=PRUxTfdXia4Cvc+j2reiuz80bws1yjKgcX/85ari0TNQnlBakHW7GCzcwfv9pSzUu6
 CH6O9YuD6/pH0U6Dd5eJzbUn4lzDKtDN2f+zFQ+I5qUCq6V8tErQ6+D77l0Cxy+/OugF
 RB8dKIALp/sjBR+oOTKk5tAqkeVqLreIeTCgJT2ScvWOLsH7x3QY0yi0fmARc9m4gnWa
 8AAOcFOMTLBPtZX+7OXKxJQ/jAWIsy2R4FaOjiMBxz9RI3LGI8RzTNVEpj1RL5UNjjTx
 YTSw388q02EUuTOY07wgi5UqlDj2esLUmq07vL7/DQZZv43ngaBfLMu2MsZnrwi9Td6g
 9t1Q==
X-Gm-Message-State: AOAM533K5D9R/g/Hc2d355pn2NXng6q5VwXNfl6JsTX5DathsUpTTGjI
 Jjxe1ZnzsMv0WjB08v7kjDfSN82KukHh0RgeoUOK2F1s6KlRCu4BWUqYBvHOZ9HfnNHHoEd4kOU
 Mp7CC5Jyhcp0GpxzD/u+weKTd/7yqPQ==
X-Received: by 2002:a17:90b:4a89:: with SMTP id
 lp9mr6673739pjb.6.1638282900681; 
 Tue, 30 Nov 2021 06:35:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCRXgemJPjRW9A0gvP1wh5yNn/WdhCWBlFTQZi+PCntn4wzo5i7noyETqEeeoY0emTtll64g==
X-Received: by 2002:a17:90b:4a89:: with SMTP id
 lp9mr6673719pjb.6.1638282900508; 
 Tue, 30 Nov 2021 06:35:00 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id s28sm22292818pfg.147.2021.11.30.06.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 06:35:00 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Date: Tue, 30 Nov 2021 22:34:53 +0800
Message-Id: <20211130143454.159221-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 03 Dec 2021 20:30:00 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/dispnv04: Fix a NULL pointer
 dereference in nv17_tv_get_hd_modes()
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
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

In nv17_tv_get_hd_modes(), the return value of drm_mode_duplicate() is
assigned to mode and there is a dereference of it in
nv17_tv_get_hd_modes(), which could lead to a NULL pointer dereference
on failure of drm_mode_duplicate().

Fix this bug add a check of mode.

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

Fixes: 6ee738610f41 ("drm/nouveau: Add DRM driver for NVIDIA GPUs")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
index be28e7bd7490..6fe103fd60e9 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
@@ -257,6 +257,9 @@ static int nv17_tv_get_hd_modes(struct drm_encoder *encoder,
 		if (modes[i].hdisplay == output_mode->hdisplay &&
 		    modes[i].vdisplay == output_mode->vdisplay) {
 			mode = drm_mode_duplicate(encoder->dev, output_mode);
+			if (!mode)
+				return -ENOMEM;
+
 			mode->type |= DRM_MODE_TYPE_PREFERRED;
 
 		} else {
-- 
2.25.1

