Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 013567118D3
	for <lists+nouveau@lfdr.de>; Thu, 25 May 2023 23:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224F210E76C;
	Thu, 25 May 2023 21:10:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831B210E768
 for <nouveau@lists.freedesktop.org>; Thu, 25 May 2023 21:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685049048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tDnyD1Q+TvZD8RBnYsiyH5gRK/DXU5xMZC5lqC7VcXs=;
 b=hM/mnt9at0ZBdh2FYfiBBvq3A2fDl29aK8OMETJwzUsf1geE4dUZYAiygkmNBqi2ApusAO
 qfr7JZHuE6Fzqh3wtTlmVdhouh70dsK5M+Dli/NRnqPeFZUKGalzdlWifYTXb65/GBaixh
 /7Xkk9zbCcV13WmfuHaQ7c688YK4Lbo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-r0wsFsaVNN-x1voBi3c50w-1; Thu, 25 May 2023 17:10:46 -0400
X-MC-Unique: r0wsFsaVNN-x1voBi3c50w-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-3f6a8c3ef10so14176401cf.2
 for <nouveau@lists.freedesktop.org>; Thu, 25 May 2023 14:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685049046; x=1687641046;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tDnyD1Q+TvZD8RBnYsiyH5gRK/DXU5xMZC5lqC7VcXs=;
 b=UCYYy0BJMyKAkNiQAllIzyt0MGUmv+WVq+UyYBrjEbMBoQiSqtXa+jQCULwzBuk2hi
 /e45DmXl4ipD6IdZ0Tz6sSmjKgLaKfgGGh1b79qX0Gau3shsidtdUq6pYegwKpnmeDcm
 EpVoZMOb9qZvVViaOL8i4WoTsUYcUI9liTnRq44jRrdDKjolxKyY2NwbAhvj0QFezFef
 Hy4a0vTlYRvWzJM7MtKMR9VYOiOSDc7Ju00oCY4haPjQM4C1ZazLgJzPceRsLXs+lT/q
 gMI10PBZ54qevQKgXUSe2U05DvaM/HPXPHlqWTQza6dodLKr2be6eyxzYhOE8pRmYfYM
 k7Jw==
X-Gm-Message-State: AC+VfDyxx/KAZxFBHsft1v2ZLNW+11DqXr1lor7LYCEhChbItyqHVgAL
 5dhhjI8QeLh5czI04dQv+LoHYmB15gf+enArzYHjoNyo8a1oB/fqo3+1C5e9JpW5fmjdpMf7h4D
 YXMLOL/zLb5g6ojYzWiSu4wLieg==
X-Received: by 2002:ac8:5acf:0:b0:3e3:7e6f:423c with SMTP id
 d15-20020ac85acf000000b003e37e6f423cmr1017692qtd.34.1685049046283; 
 Thu, 25 May 2023 14:10:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6tZiuI8gD3Aif7n+Bf8DUaassrUnfxP6XFasaXNKtLHxyDyblw20JldsbFKRXFeXMklWQvIQ==
X-Received: by 2002:ac8:5acf:0:b0:3e3:7e6f:423c with SMTP id
 d15-20020ac85acf000000b003e37e6f423cmr1017674qtd.34.1685049046045; 
 Thu, 25 May 2023 14:10:46 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 br5-20020a05622a1e0500b003ef5dc13bbbsm702340qtb.85.2023.05.25.14.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 14:10:45 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, gsamaiya@nvidia.com
Date: Thu, 25 May 2023 17:10:40 -0400
Message-Id: <20230525211040.3233982-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH] drm/nouveau/acr: remove unused variable loc
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

gcc with W=1 reports
drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:221:21: error: variable
  ‘loc’ set but not used [-Werror=unused-but-set-variable]
  221 |                 u32 loc, sig, cnt, *meta;
      |                     ^~~
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
index f36a359d4531..bd104a030243 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
@@ -218,7 +218,7 @@ nvkm_acr_lsfw_load_sig_image_desc_v2(struct nvkm_subdev *subdev,
 		const struct firmware *hsbl;
 		const struct nvfw_ls_hsbl_bin_hdr *hdr;
 		const struct nvfw_ls_hsbl_hdr *hshdr;
-		u32 loc, sig, cnt, *meta;
+		u32 sig, cnt, *meta;
 
 		ret = nvkm_firmware_load_name(subdev, path, "hs_bl_sig", ver, &hsbl);
 		if (ret)
@@ -227,7 +227,6 @@ nvkm_acr_lsfw_load_sig_image_desc_v2(struct nvkm_subdev *subdev,
 		hdr = nvfw_ls_hsbl_bin_hdr(subdev, hsbl->data);
 		hshdr = nvfw_ls_hsbl_hdr(subdev, hsbl->data + hdr->header_offset);
 		meta = (u32 *)(hsbl->data + hshdr->meta_data_offset);
-		loc = *(u32 *)(hsbl->data + hshdr->patch_loc);
 		sig = *(u32 *)(hsbl->data + hshdr->patch_sig);
 		cnt = *(u32 *)(hsbl->data + hshdr->num_sig);
 
-- 
2.27.0

