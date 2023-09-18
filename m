Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 400587A53A8
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0D410E2E5;
	Mon, 18 Sep 2023 20:15:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E3710E2FA
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:15:32 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1c43166b7e5so32110955ad.3
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068132; x=1695672932; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qFo3C4lDFziIIWB3tPPOJQav0VIHeaXVnkWUpCedLoM=;
 b=EyYzsB/xCdTPFtgHZ7BHRBYJu5LTK8lVwK8B+aeedcwSHcGCDHVU7tOiDg1HMUVsny
 iaXSSUZX1Fdae4mN2tFJzX6ZY+wk0wWdgw4vNMxBTGoDfPM3jNHzVqfcYGwRiYKUUe2A
 M0bBG+/SUIL4XhpcqGEnmCtElLTeiLrBk7UMhUyUyITgJ+j7J1NrF2gDfUMQdzAe4BaM
 zQ/y5GBVR/2NXzlwbT6x1XMj1RsQqlSPXOs7/Urc1vyIcmDdTLI7ONtFH15IhSYBaDLO
 x19/BDZUgp5OhETSRvAvJkE9L/WEEPBUzF9ts5ouLJZP0r/xBfp1KVi4Z97BNKzekLq6
 7zUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068132; x=1695672932;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qFo3C4lDFziIIWB3tPPOJQav0VIHeaXVnkWUpCedLoM=;
 b=YkZZgabaaWM/1mGQcqAgN0sjklYe7kN94LfEfpG1RgzT0Izl2ubZGruClm+U0WCp1L
 yeOLNKR+xYGgm3wJK0ELRQkp/2++KWz5giV45KRwx7o91Wb7F2kSM6osj33tem75Gxuo
 x/6TwwP6THcXbtuz+fhszZkolltDUfOcdSebnGj2y+kXZ1S3rPQQSmnfP/49iBvG3sYq
 RpEotI7gWiSVDsl36oDXTsZYO3ouRkaTRg8JyS21RLYYoDzrB9ceI5CXOzfRWoJuBAj0
 V6nmZzk7kdNYzaFrxxymydpev468d8DwfaFR0BkgQKkSw09G7nYtaMt0k/pl7NsBU9hJ
 +8IQ==
X-Gm-Message-State: AOJu0Yznt7VirbOIr5BNmre4+29oErSgeubG+jq3Lamdjo6WoQXNJyNu
 cqaS8x0lSRLiaxhp9m4kQluvTqyEEVw=
X-Google-Smtp-Source: AGHT+IH5BoWf8c29LjEukFfH7ZSFgZpq9AobVy49u/+YgjgfVDF0c002MPOh45p3fZy3GFFe+B6b9Q==
X-Received: by 2002:a17:902:ab12:b0:1c3:df77:3159 with SMTP id
 ik18-20020a170902ab1200b001c3df773159mr9785536plb.50.1695068131795; 
 Mon, 18 Sep 2023 13:15:31 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:15:31 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:49 +1000
Message-ID: <20230918201404.3765-30-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 29/44] drm/nouveau/kms/nv50-: split DP
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
Reviewed-by: Lyude Paul <lyude@redhat.com>
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

