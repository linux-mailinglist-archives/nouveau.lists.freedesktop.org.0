Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFF150963A
	for <lists+nouveau@lfdr.de>; Thu, 21 Apr 2022 07:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298AD10F337;
	Thu, 21 Apr 2022 05:07:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85DC10E5C8
 for <nouveau@lists.freedesktop.org>; Mon, 18 Apr 2022 15:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650295698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ih9PEnp4Wjk+k/+TucNV83KQkvF18ND4JmzRmAmOEMs=;
 b=dxf8sj5mHBiFuBn73aATkUbEhNIOZPtb6xOPVQ25BD7HloNiq16uq3cQmzxCKbXlS85rMH
 /W55o8vUXclrhNjoJIwEepMw08OB6Jbjr+RWp9DA/lm6ViTLiOHnWc0UrEBsadVECRSiQ9
 P3IqT2QZv6ZGzIKsmYSEsJY5ChMDzms=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-ZihChRIpNOKtLk7D9dq0nA-1; Mon, 18 Apr 2022 11:28:17 -0400
X-MC-Unique: ZihChRIpNOKtLk7D9dq0nA-1
Received: by mail-qk1-f200.google.com with SMTP id
 u6-20020a05620a430600b0069c0f5ad4e2so10609273qko.2
 for <nouveau@lists.freedesktop.org>; Mon, 18 Apr 2022 08:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ih9PEnp4Wjk+k/+TucNV83KQkvF18ND4JmzRmAmOEMs=;
 b=s8vkycBbCogSWbX4K2w7U15Skyf+aDt+LIWbtEw8PPoH5AejcyAJ/dJm8eUioIlRbk
 bz+pebkxfsiPMtUw5diTWbLhvh3noH4XSGsA5/MK+z1BohPGjlUBKgKKfSQuIoCJ4TF6
 msd/bbmY/btRwJxZlSmmK48zzfW+DCEc0EP4ca194eypAZd+lJXdpQ2ufnI3D0LK6zwq
 lNUSXShTCPBSJNK8FPBt25WUqIySBzgrtr28fpg2YDUa241orAslR+Hs8m3LQEx2EHnb
 N86zp/ry5t5JtR1DbE4dZ5NlBRAp9SlfhehYDZ86vu/PZ6O9TzVmVDif5sCNseS7ps0l
 e2pg==
X-Gm-Message-State: AOAM533Hazr3VxHeGYatd3r1JgNA4qwPocFUCoxajYG3o131DvpeotWn
 vyC2ITYF//UE/bDLGZ+NlN6wis9Q7Cks3+nSCDrKnCAzbMYQkQ9qL7QDkxptie8xL/LbmLF5UFG
 a734r13g1PjaoUjuuezUtiYm0ig==
X-Received: by 2002:a37:447:0:b0:69e:a2be:f270 with SMTP id
 68-20020a370447000000b0069ea2bef270mr2733230qke.130.1650295696834; 
 Mon, 18 Apr 2022 08:28:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxd+rW0DF6snrQAx/DVgdX3YAtlSUyaxLZbHZLhwb0nZYBV6ivGoW0JK0uNu8zwYr3h06hFlQ==
X-Received: by 2002:a37:447:0:b0:69e:a2be:f270 with SMTP id
 68-20020a370447000000b0069ea2bef270mr2733212qke.130.1650295696615; 
 Mon, 18 Apr 2022 08:28:16 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 y66-20020a37af45000000b0067dc0fc539fsm6830397qke.86.2022.04.18.08.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 08:28:16 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Date: Mon, 18 Apr 2022 11:28:10 -0400
Message-Id: <20220418152810.3280502-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Mailman-Approved-At: Thu, 21 Apr 2022 05:07:14 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/gr/gf100-: change gf108_gr_fwif from
 global to static
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

Smatch reports this issue
gf108.c:147:1: warning: symbol 'gf108_gr_fwif'
  was not declared. Should it be static?

gf108_gr_fwif is only used in gf108.c.  Single
file variables should not be global so change
gf108_gr_fwif's storage-class specifier to static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c
index 030640bb3dca..ab3760e804b8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c
@@ -143,7 +143,7 @@ gf108_gr = {
 	}
 };
 
-const struct gf100_gr_fwif
+static const struct gf100_gr_fwif
 gf108_gr_fwif[] = {
 	{ -1, gf100_gr_load, &gf108_gr },
 	{ -1, gf100_gr_nofw, &gf108_gr },
-- 
2.27.0

