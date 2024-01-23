Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAFC837928
	for <lists+nouveau@lfdr.de>; Tue, 23 Jan 2024 01:30:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055DF10F1A9;
	Tue, 23 Jan 2024 00:30:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B09110F1AB
 for <nouveau@lists.freedesktop.org>; Tue, 23 Jan 2024 00:30:09 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-5999ec531dcso267720eaf.3
 for <nouveau@lists.freedesktop.org>; Mon, 22 Jan 2024 16:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1705969749; x=1706574549;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HbagvK/BQHg13GLlZBGhyNRG5sgL74HVCqkvwUtdz7s=;
 b=jCl7DvjriEIX7xTSssi7UZbrLRJvnL/YtwbsqQc6AFttHymQ+fGgVSus/d2LbQftBM
 CSU/eYMn/wicKYjd8FEUBwTZbA3wEYGJHFNv3pv1WV4F/+OSGhWtrfXXm6whSiP2of0W
 9OzXpABiwsOjJEeqfBv1eZZi8sBnGEnd+7wSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705969749; x=1706574549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HbagvK/BQHg13GLlZBGhyNRG5sgL74HVCqkvwUtdz7s=;
 b=lzuBD/HRSleKXud+uJCOfDGvoUWO1FXcl+QoO+b8MxbvsFrYEdJcbOETjJqA8TLtHl
 V7ysmrQCGfg7gl3c4fl4SFwbIipJ9Qk2QZTPDov9CYoFvc+RwOIgVPWA+OjDhiwtu0k9
 zBWvxpx5UnKiQ1JJfsKdeSsdX6IZCumfuXzhPzc2DBpwwl+3c0qiEzzDw3p0VxhpWk2B
 MnC4tndjrICvUhQpvYLeR9N7JLtITzkFvd+E7sCpIuOVPRxV9/ds/0NXrgMO/KqnF10v
 8ALNu6bU2aQNWxaf3NyK8aq5A8Iq8bIV2Mrw2Tqj+A6PHPS29lufsN5izlrvpYn0ZFxD
 Orrw==
X-Gm-Message-State: AOJu0Yw4iSwCAqUeeCBfGYeHJe6klZMNhRUPDTwM5nPsEwG3cfyJRJ0M
 d1fPrZ7G3RAc9eJHL/i5DovEb5hTJn1Hp55NvitZCQwtgBM1wB60V46qS9xp1A==
X-Google-Smtp-Source: AGHT+IE3YZZUAbSaTl6FBGOnqrae/sTpKUCuHtMEUe62rjmX2GkYQhqBolPrkv+LnabYxlrO3YWYvg==
X-Received: by 2002:a05:6358:916:b0:176:5d73:376f with SMTP id
 r22-20020a056358091600b001765d73376fmr1694130rwi.48.1705969748687; 
 Mon, 22 Jan 2024 16:29:08 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a056a00218300b006dbd341379dsm4094216pfi.68.2024.01.22.16.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 16:28:53 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 48/82] drm/nouveau/mmu: Refactor intentional wrap-around test
Date: Mon, 22 Jan 2024 16:27:23 -0800
Message-Id: <20240123002814.1396804-48-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122235208.work.748-kees@kernel.org>
References: <20240122235208.work.748-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2285; i=keescook@chromium.org; 
 h=from:subject;
 bh=uRCkCvFsyXVpf/RtG8GCWMvVuyi59RVZ9Ft/3XBajpQ=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlrwgJXxmYjo3BZJuP6sKHQxKb/M3OqOpXccNUZ
 qhhlaPYu4iJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZa8ICQAKCRCJcvTf3G3A
 Jh/nD/91bB80GL2rgD2Qu9VZOfFU0YicaQRtXMeoaSbnOb9C6bplAraUcHoNvH0F/nzlJcxXU25
 tdFLoL0nVtuTpAc0QwLgnxaobRa9aNgWmW3DUkrO812C5TjVwlXYjliSrA5pLSd1FCOwfEGcLUB
 OasKeE6baUkZj6ytjNign6jV35ncfvu3y/C2MxtKBkts8n1Zwzi540pe8I5UtlySd6rBQjtelTV
 w6SFBV5r1npI2fEZqGplZzZO7EajApmc7jJz1thGgwOaC77JZl1JuklmvrMC4ret/lDs/ycUAAk
 D8MK5b6uevWOPdEY7obK82UJzkJkmcTaxAOtZlX95h01L7rkYBfeFsMYiZxSkbcDNRIQoWxack0
 kuRc0oFbZDU4aaCtjbvKo6CHFYuBsv1B3qzy/dUdlEfz7Q8x7GSiUp1v2zZMHdUUy9zFSFFvHoE
 kZoHAeuRu/Gh7kJhCX7dMPQXqmh1IyQcF7QoTRKQyay+Kirq8rSRKVyOK6qdr+F/8jCxx92g3nD
 2liBspnno23rcfzBqyJV5XbpEehmcvR0R30g5ubq4aeUy2+NIh26YpvJYBT9PIeuAR6WWh7/jm3
 dRFK6//1Q7sP6hjFLcugQJcs/LAqMyL9p1u+btGAthR59AQsdV1I6mj3Cqxb1SXG6UXNsaiPyRb
 lV4UD0ZObcOgDAQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
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
Cc: Kees Cook <keescook@chromium.org>, nouveau@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Justin Stitt <justinstitt@google.com>,
 Dave Airlie <airlied@redhat.com>, Bill Wendling <morbo@google.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

In an effort to separate intentional arithmetic wrap-around from
unexpected wrap-around, we need to refactor places that depend on this
kind of math. One of the most common code patterns of this is:

	VAR + value < VAR

Notably, this is considered "undefined behavior" for signed and pointer
types, which the kernel works around by using the -fno-strict-overflow
option in the build[1] (which used to just be -fwrapv). Regardless, we
want to get the kernel source to the position where we can meaningfully
instrument arithmetic wrap-around conditions and catch them when they
are unexpected, regardless of whether they are signed[2], unsigned[3],
or pointer[4] types.

Refactor open-coded wrap-around addition test to use add_would_overflow().
This paves the way to enabling the wrap-around sanitizers in the future.

Link: https://git.kernel.org/linus/68df3755e383e6fecf2354a67b08f92f18536594 [1]
Link: https://github.com/KSPP/linux/issues/26 [2]
Link: https://github.com/KSPP/linux/issues/27 [3]
Link: https://github.com/KSPP/linux/issues/344 [4]
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index 6ca1a82ccbc1..87c0903be9a7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -1291,7 +1291,7 @@ nvkm_vmm_pfn_map(struct nvkm_vmm *vmm, u8 shift, u64 addr, u64 size, u64 *pfn)
 
 	if (!page->shift || !IS_ALIGNED(addr, 1ULL << shift) ||
 			    !IS_ALIGNED(size, 1ULL << shift) ||
-	    addr + size < addr || addr + size > vmm->limit) {
+	    add_would_overflow(addr, size) || addr + size > vmm->limit) {
 		VMM_DEBUG(vmm, "paged map %d %d %016llx %016llx\n",
 			  shift, page->shift, addr, size);
 		return -EINVAL;
-- 
2.34.1

