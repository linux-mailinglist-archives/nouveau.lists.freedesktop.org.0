Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA0979FEDC
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 318AF10E53C;
	Thu, 14 Sep 2023 08:48:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB4610E545
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:48:03 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-68fba57030fso639772b3a.3
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681282; x=1695286082; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XacHleFX/03yAoNJJmVx2khHcdYqNRUIY8KPL1Ua6QA=;
 b=h0YWx/xG1MWjqWA53+Yo1bX6yKBcGjipMVqcmA3Co/h8EFOl16dfl1Gpq5XtDoJ7Xh
 LZCibaxDH80+3v8ZIupqMSdMc325dVnU6Oxob3Eki1h6l+K240blM/FQnisb3gCULsk1
 yM36397LH5kHepGsbk2UtXrG3CBF7sZKNjjay7pkSPmoo5O63XNXYHqePVZS39Y+mp4X
 taS/JyUYP4V8KpHqWLTOgn+aW/kiGJuVqxBGme9V1Ru4G5R3dnID6a6LX+1ZEM8rRHGF
 ap2ITlKS4eIMlPpd0RQ/tKuPpYaGo+QiF9yi26B29NmVnCHvshFjFYkkammL3KihPtXA
 zMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681282; x=1695286082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XacHleFX/03yAoNJJmVx2khHcdYqNRUIY8KPL1Ua6QA=;
 b=OiaqN2eDt0TWTQ5O0VhbFqb/tDOdViaEgae9Q6jbYWrFvf+y+RqthYgPqcxj98ChTD
 RYMtBc7RjZ8GRiIGNTuYrwR0pJIxIoFBfAWoxCLNKW4sRNIrT5tZf4GYHyPGvCR4mcbL
 tEofmNblgmaM33x5dZKTDuNJKla+2kRN6HdWmjLbgWlcckv/eafp99Ycmw+/EnbSdbJu
 eB0yIM0Oz131pEWXA2ERkTrhH9K/D79eRlhOpqcqZ3QBCiXjCV2jQEvohqFBJkK1S/pP
 ndLePegGOOiCXFrV5Q3gg5XSQr9SgX0bkav9ohS4o+mLzSGywhmGO0mFH59GCQgs/qEy
 HSSw==
X-Gm-Message-State: AOJu0YzY9q4qM1rCZDs+PEvx2tlD7T7EpdLBRBQWbXf6nuo28Xa0Xdot
 woCxdcAf0LZnSvxCG4DxOXl12WB9dZg=
X-Google-Smtp-Source: AGHT+IFIABlih0ePWmObUMGwoT9SZ3qrhQxwu1tmkDhCvwgaUEaMR6YzdllXSF9/I3QxiBP723RE3w==
X-Received: by 2002:a05:6a00:2347:b0:68f:cb69:8e6c with SMTP id
 j7-20020a056a00234700b0068fcb698e6cmr5820314pfj.33.1694681282192; 
 Thu, 14 Sep 2023 01:48:02 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:48:01 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:46:10 +1000
Message-ID: <20230914084624.2299765-31-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 29/44] drm/nouveau/kms/nv50-: split DP
 disable+enable into two modesets
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

Link training can finally be moved out of the supervisor sequence,
but first we need to split DP modesets into separate disable and
enable sequences to be able to perform link training between them
instead.

- preparation for GSP-RM

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index d52735cd9d38..b7e9f951eee3 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2377,7 +2377,8 @@ nv50_disp_outp_atomic_check_clr(struct nv50_atom *atom,
 		if (IS_ERR(outp))
 			return PTR_ERR(outp);
 
-		if (outp->encoder->encoder_type == DRM_MODE_ENCODER_DPMST) {
+		if (outp->encoder->encoder_type == DRM_MODE_ENCODER_DPMST ||
+		    nouveau_encoder(outp->encoder)->dcb->type == DCB_OUTPUT_DP) {
 			outp->flush_disable = true;
 			atom->flush_disable = true;
 		}
-- 
2.41.0

