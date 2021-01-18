Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0542FA73B
	for <lists+nouveau@lfdr.de>; Mon, 18 Jan 2021 18:16:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57386E446;
	Mon, 18 Jan 2021 17:16:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605506E446
 for <nouveau@lists.freedesktop.org>; Mon, 18 Jan 2021 17:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610990170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zPWPbpxZWQ8Q/hCVXbr12g2BZoHJDH3rLZiVqLyNR4s=;
 b=PIoO/tlWrxWRIj8zAbfOAECuaWHxPaCfSbRTO2Qy1R2HEaGcl5sQZd/2/o1eTI9ccRxMqV
 LxwVYRSWYHszwPdJNH9d+8LZ3Nsek9YBAWTjn2d+cuGxXCoBsWeLZn/mdevKErxN23GT2R
 3jRy2UcoVV677Xhr9NXNr77obPw7mu4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-9pcn-21DN-qhXCP9LUSNzQ-1; Mon, 18 Jan 2021 12:16:08 -0500
X-MC-Unique: 9pcn-21DN-qhXCP9LUSNzQ-1
Received: by mail-ed1-f72.google.com with SMTP id g14so8166717edt.12
 for <nouveau@lists.freedesktop.org>; Mon, 18 Jan 2021 09:16:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zPWPbpxZWQ8Q/hCVXbr12g2BZoHJDH3rLZiVqLyNR4s=;
 b=OGVuSycOb7EhLSNcZ659RL5rRLvikxAtrwPXu2Gv786oV7CJtYTgVy7XBYa+sh8y2F
 SwplG3JZyQHGACfU2FJaXAAdFZ2G0sOcDFT8fRlnILZRoEGil5ryB+zYuYNFF0f3gx21
 jxWyS2uL2E23ogaMQsAx6F552WqjzjrPgfZzbZSz9fCIM/CKzpdIuYcDqRlSKN9RbRD8
 4RinwaXhvhodv8ksprfRRcfU9l3diX0JPYQYlJqO21JzQT9PkHv7k6R2hM/ZdSoFg9MH
 CzFkiuQsAUbxS/cz2z7en0SL1s/iykkuQwbcVQikGncCpFjHogfSzYHWXKT3EDC599tg
 tcxw==
X-Gm-Message-State: AOAM533iBrynR+ajMYe5TaObfhkR0fPIjhE1BIkowUGXLCE3+oxL/hIJ
 l8W9Qb+CE/dQ/e0eZyO38aF4LJ7MULRwSyH41IFe4hluJRfET3HkiW3Jewaakj/WtqqmmFGxAWS
 vDHvADrnfJR6EDpX5XwzSz2/kSg==
X-Received: by 2002:aa7:cb10:: with SMTP id s16mr383916edt.304.1610990167270; 
 Mon, 18 Jan 2021 09:16:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEjn0yaOyT8VeVvxbTFfawWNsNOlofn2pYeeSMukmaS0N7WcyAgfAevbwrdw8SfatYeJqpwg==
X-Received: by 2002:aa7:cb10:: with SMTP id s16mr383903edt.304.1610990167154; 
 Mon, 18 Jan 2021 09:16:07 -0800 (PST)
Received: from kherbst.pingu.com ([2a02:8108:3d3f:f97c:65d6:8fd9:2fe5:eed])
 by smtp.gmail.com with ESMTPSA id n3sm5152323ejd.85.2021.01.18.09.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 09:16:06 -0800 (PST)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 18 Jan 2021 18:16:06 +0100
Message-Id: <20210118171606.2055109-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH] drm/nouveau/svm: fail NOUVEAU_SVM_INIT ioctl on
 unsupported devices
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Fixes a crash when trying to create a channel on e.g. Turing GPUs when
NOUVEAU_SVM_INIT was called before.

Fixes: eeaf06ac1a558 ("drm/nouveau/svm: initial support for shared virtual memory")
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 4f69e4c3dafd..1c3f890377d2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -315,6 +315,10 @@ nouveau_svmm_init(struct drm_device *dev, void *data,
 	struct drm_nouveau_svm_init *args = data;
 	int ret;
 
+	/* We need to fail if svm is disabled */
+	if (!cli->drm->svm)
+		return -ENOSYS;
+
 	/* Allocate tracking for SVM-enabled VMM. */
 	if (!(svmm = kzalloc(sizeof(*svmm), GFP_KERNEL)))
 		return -ENOMEM;
-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
