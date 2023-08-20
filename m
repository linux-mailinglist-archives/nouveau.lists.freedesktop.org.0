Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 648CE78209D
	for <lists+nouveau@lfdr.de>; Mon, 21 Aug 2023 00:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5557810E16B;
	Sun, 20 Aug 2023 22:29:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6D110E035
 for <nouveau@lists.freedesktop.org>; Sun, 20 Aug 2023 22:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692570568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YPhQSl7EkHeXJaVSqjtUG2Pb7auEbNHbcpRSgSMEH1A=;
 b=BXP2QRaU88EbCkO1+AhujWfV+uQsxCOdA/j4ADvCYREU9c2eRaPUx6iBwV3X3O5+LVWDgq
 JCyRNOOoefHioXUM6fpC85KQvU1IpR7Dfmrecl6y36j5cT/F/YesTrXS4XmE7VzJelw/+h
 ciSuIE12qdY/ypm9LeIP5EWb21VtNWU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-py4YNZPeMMeIP6FnnSnFtQ-1; Sun, 20 Aug 2023 18:29:26 -0400
X-MC-Unique: py4YNZPeMMeIP6FnnSnFtQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94a34d3e5ebso160368366b.3
 for <nouveau@lists.freedesktop.org>; Sun, 20 Aug 2023 15:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692570565; x=1693175365;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YPhQSl7EkHeXJaVSqjtUG2Pb7auEbNHbcpRSgSMEH1A=;
 b=eayX4EshougNdm3nCVtmzNxyZH44P09zAsdr42wh55aWaXhXUtQFwWkVqrjwCh6e4f
 Bzd9SE1g0SN8R3LEScMvrg1V5/XPDzCPj6fDthX5G09mkK608S1kotiZCG3k+TEGpPXH
 eB/V/ykmoVms/8Xfso/GprvjcVu8KXpQpBOXoyMrhHZIcU9V/MC9ZTaLpBQIQpisDHZw
 XuPYgPjMZQGCOnK72tPM40qqXTB+qfxMjVVjrsDoNObQxxpzhiB4+Mb8U32jEk2UQsgY
 nCk+btgCPzJRxrhiKzntdmO2S7m5ZN2Bd+8ExBifQkau5YabAoh85OcF+zGQIStS9uKn
 gdjg==
X-Gm-Message-State: AOJu0YwDrT4EoIzkWdO7s2Df5ofI7s8jy/zfVF6aMJXbk/HPz9x+YGzx
 8BR6kHsGWoCuIbooI4AQAdF41It09KLu6HgoLq7HRbpGWj7BpDXFcqxYrOMS8sPGSLhR9uYGhhH
 NbK8KmMOspOYqdZgtUwL+S5swKA==
X-Received: by 2002:a17:907:77c4:b0:993:d536:3cb7 with SMTP id
 kz4-20020a17090777c400b00993d5363cb7mr4188735ejc.11.1692570565800; 
 Sun, 20 Aug 2023 15:29:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3E66CloZzC5H6aCpbP5SgT88XUYTNuLaQ2K+qLz0CTNXQrDXDaUTKDGZiMqAUR3LIjhbRIw==
X-Received: by 2002:a17:907:77c4:b0:993:d536:3cb7 with SMTP id
 kz4-20020a17090777c400b00993d5363cb7mr4188726ejc.11.1692570565517; 
 Sun, 20 Aug 2023 15:29:25 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a170906a10300b00993860a6d37sm5324078ejy.40.2023.08.20.15.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Aug 2023 15:29:24 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com,
 lyude@redhat.com
Date: Mon, 21 Aug 2023 00:29:16 +0200
Message-ID: <20230820222920.2344-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next] drm/nouveau: uvmm: fix unset region
 pointer on remap
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
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Transfer the region pointer of a uvma to the new uvma(s) on re-map to
prevent potential shader faults when the re-mapped uvma(s) are unmapped.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 3a1e8538f205..aae780e4a4aa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -639,6 +639,7 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
 			struct drm_gpuva *va = r->unmap->va;
 			struct uvmm_map_args remap_args = {
 				.kind = uvma_from_va(va)->kind,
+				.region = uvma_from_va(va)->region,
 			};
 			u64 ustart = va->va.addr;
 			u64 urange = va->va.range;

base-commit: 25205087df1ffe06ccea9302944ed1f77dc68c6f
-- 
2.41.0

