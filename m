Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA132853B8
	for <lists+nouveau@lfdr.de>; Tue,  6 Oct 2020 23:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF096E598;
	Tue,  6 Oct 2020 21:13:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046DB6E59B
 for <nouveau@lists.freedesktop.org>; Tue,  6 Oct 2020 21:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602018818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Gn68Ygtjq57f4L8sEj+cgS8lU4S8F0eu39CHVnV1oQ=;
 b=gEP8xaXBk8TCNfL0FXt9By2qApyn6NCmi9t9L5zCuinK1RQ9K2k7r1X/Jl+jwrJ8cD4cWp
 doyU6mcsQiUmRqyx6YhY+YJxabNQ4AHtvIlthe/t3BRYhaBKGbk+ROJSnj8f3OtieXyc/O
 OChT8aKOTN2bcLvMHLRqj8v4doFQyqM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-SABk-Pn9NH2UNVeCXQADuQ-1; Tue, 06 Oct 2020 17:13:33 -0400
X-MC-Unique: SABk-Pn9NH2UNVeCXQADuQ-1
Received: by mail-qk1-f198.google.com with SMTP id 139so10236975qkl.11
 for <nouveau@lists.freedesktop.org>; Tue, 06 Oct 2020 14:13:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Gn68Ygtjq57f4L8sEj+cgS8lU4S8F0eu39CHVnV1oQ=;
 b=pr7kUmhGznVezr8EdH7hhzTmkhos+Gu4cKYo6ttiQme/vma9iNPq8hpWF3nHLARvbj
 A2fqGM/u4Fo1FGnjuaxmzQnnuTCq2bfREW4DK7zsmm0GG8DbJQtgsMPf9aT6C05l5XD2
 Q+lJi+6zkU9F6Nsa16hWA3LucqBtcJjlJK7e+TuOTJuN08Cdw70B8ZJH4/RGkdMCYT9j
 bcN0a2n7fkuXfHVlxfDc4sSwXuhoMDY2O19UXrJkKzVs5RP807MS460FapDPjUanzSJy
 d3IuqYu7+7PiwTV3rPHRdUcHEyohRclJLLHMbFirlUpB/qDilnNvJcxJYJ4KoZcfKBHr
 2wbg==
X-Gm-Message-State: AOAM532qOEcNO/IDJC6hkWF5VIdg7Z8nW+r+T6YQq6TqUiXaYI+QIXxb
 yvpduRbU9GhPw2xF2vc/erKap1O43A16MJ8G2YS4sn4QhZwHQyShSsiULKTUtPr9C6jGlHnU4BY
 NFDJSLMuOQiPsxeeu7K2AqlGoZg==
X-Received: by 2002:ac8:4cc2:: with SMTP id l2mr185313qtv.207.1602018812433;
 Tue, 06 Oct 2020 14:13:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjLLnibiLW6b1EF6xUgzVb0Eq5UuTTbz6J7FG/yKxzobudZ56sNJRL30jNJsKn45gq1CKKVg==
X-Received: by 2002:ac8:4cc2:: with SMTP id l2mr185300qtv.207.1602018812206;
 Tue, 06 Oct 2020 14:13:32 -0700 (PDT)
Received: from xps13.jcline.org ([136.56.20.95])
 by smtp.gmail.com with ESMTPSA id h68sm3714277qkf.30.2020.10.06.14.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 14:13:31 -0700 (PDT)
From: Jeremy Cline <jcline@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>
Date: Tue,  6 Oct 2020 17:13:10 -0400
Message-Id: <20201006211313.49177-1-jcline@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200911162128.405604-1-jcline@redhat.com>
References: <20200911162128.405604-1-jcline@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [RFC PATCH v2 0/3] Documentation: nouveau: Introduce some
 nouveau documentation
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
Cc: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi folks,

Here's a v2 of the initial nouveau documentation page.

Based on Roy Spliet's feedback, I added a pointer to envytools
documentation, and attempted to clarify that this document is only about
software architecture.

I also noted more clearly it was meant to compliment the nouveau
freedesktop.org documentation.

Finally, for some starter documentation I dropped my vague placeholder
documentation on the display engine struct and added notes on the CRC
work, which I recently became more familiar with.

I've left out sub-sections for which I had no content, but you can
imagine the nouveau-specific ioctls being documented in their own
sub-section of the "Public API" section, or additional sub-sections to the
"Private APIs" for NVKM and such.

Let me know what you think!

Jeremy Cline (3):
  drm/nouveau/kms/nvd9-: Introduce some kernel-docs for CRC support
  nouveau: Add kernel-docs for module parameters
  Documentation: nouveau: Introduce some nouveau documentation

 Documentation/gpu/drivers.rst          |   1 +
 Documentation/gpu/nouveau.rst          | 173 +++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/dispnv50/crc.c |   8 ++
 drivers/gpu/drm/nouveau/dispnv50/crc.h |  65 ++++++++++
 drivers/gpu/drm/nouveau/nouveau_drm.c  | 162 +++++++++++++++++++++++
 5 files changed, 409 insertions(+)
 create mode 100644 Documentation/gpu/nouveau.rst

-- 
2.28.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
