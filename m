Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AC3CEAF9A
	for <lists+nouveau@lfdr.de>; Wed, 31 Dec 2025 01:57:27 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6796A10E96E;
	Wed, 31 Dec 2025 00:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DXCDesss";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A83AA44C66;
	Wed, 31 Dec 2025 00:49:26 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767142166;
 b=EhfUirf6L2elRNAhks6DvyjUpNON9Q1uz5dHePtDSCdWFT3hTekLuTs9gJKcAcKuxLREE
 d8SUDzHKqnDVxslw5vMNxlH4YXO237klMKUTNtbed1bE8UJFIeWLh7EphxD8lOQW1taSBoh
 XQaFpa77q4QaqaXvYu+Q+fp92nRzNQWLMn2z7UTHyb1jiuZsjFu31GfX/V1OcuV4HwpdcZc
 QNFz5QYiFDVBzCqnclXcaYL61R/3YMc4aI2KcrXyxpuu/TFKlgDkL0i348769WLRpq/X17Q
 KpfFSgdUrC/kfM4LH1s+IpeL2lfADlSOeSbWgMzmOXMjWoRiSSSv+4MbiZwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767142166; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=y3E1JXxIVHpMJqtMAwCll57AM31/TkT0PGW+VAaoHfw=;
 b=0575ZVNJlNlLBJW/83GOdN8+LtPMvR5xJisMT3b2fmNIeRgi8CX4ZF9n+D1tzfR5jxOLm
 pSzQ2xLLtGBhMfBT3WmtrH9Ap2SOluCoOHXkb8Rw+uXvrMjpMKPdGC9omR7zWcuCk/BpyDd
 Hkhv+acFvEhPdImFEfKwWjNrRKAU9oCaKObgwZCXXY4VPW9m++nEKyEbrOap+foD6M5aRO1
 vqkcLWrfNtLrdMcglJtGlzDMBvi9g1IF4y6ryvRdE4S3YLrYS8q1DzjVNWVaWFM1N9uBal4
 yDPv2YS0Y0chsyQI2EOX/wgN86Ae8Q+JOx53vXBOJf/w19YzBK7HbdFE93gg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 82C5B43E41
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 00:49:23 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E078510E236
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 00:57:21 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-34eeffdb197so605003a91.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 30 Dec 2025 16:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767142641; x=1767747441;
 darn=lists.freedesktop.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y3E1JXxIVHpMJqtMAwCll57AM31/TkT0PGW+VAaoHfw=;
        b=DXCDesssyuhxg5mlcUdmK6fEM2ePhpZ7aMEcs+Q+YQ5NKLbiFrLJi8WJJGfG1HLr07
         lsSNs0u/+4YC5ofdDaSf8RFaLdM75r6YrNNeRhUPbNIKDaCOe2+4ccRREpOVDrQPRcqT
         UMwoSWPedqnh5HtFwExW+5Qps5hzQwHZUYtG6DvkR5Xgs+h9VrQVJRcFpNXJ2JG19YgC
         /260UeY47kxkmgQlV6VTvHqIIQHyjyNcsrfI7yWKRaxavJr0tFXonFT3QqurCX+CNa0C
         CaixUoqRyA0dM1tNjqxJRToYOvp3/0VVGkdu3Npzu9VhF6N2XiOUv90V9fBEa1m6ahbm
         DhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767142641; x=1767747441;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y3E1JXxIVHpMJqtMAwCll57AM31/TkT0PGW+VAaoHfw=;
        b=jTq2IKFTltQeBqiF6XqNvoovQiRyH3urElHaDqFI5/jFS8RDjrbh1Yv79CpPQdZjeF
         mYbJCdRjg64NzvzoFJPAgEF9JbxP1U/Oaq98SLhoS9MSfGi1Pv331/NVWqBAWzCuU8hF
         9ANp7fMcNbDjrgWgu2UjjO6FWr0tf1Tsfu7hw8nDrQY5Bh9cvyt5PRN7qqB+K55h7akH
         FkFox2m9KLHWlUj6mqDUivX6sWyaEKbbtVlwXd9F0V+DPRdQWfaQw6awngQFbEOwdGXf
         JowTprFNG2OETwC18VCNNKkq24swjBlG/rIAfG798FFYaN0wVQ3OyUtPtLlk0a8PZ0NQ
         D8ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmpzfG4tEUr5JsAWMiTKhRBcDkT2IoR4eIVqRNCA9he0xPntyD7bNreBe5OFKFVdkf2pbvZTG+@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0T5SnWWp5LmEOejoNygTsrdrDSvjS48u9Sypg2jOwW0GVcXXt
	T0tHVf2+ibv1O38y215x9IxXs6ccg7cGmGDvxvHNCofy6DVEY1+w31/tcotBjBJSRARHCyZewTh
	dI69cTSxuSZ2DUUhxLiwBYjc0lo+x2D4=
X-Gm-Gg: AY/fxX4GafZLVSRnhydo5YOWloLOh1fd07qSqi9wJGG+N5hQ8DA2matOs9tjg+QjW6t
	cX+VNG6V4n2IJ4NuKpgXiAkQwlXNT4xkanGKOu/IcdqpZFi1+QEZAcQx2UG23ndNkYvyJScTJ/D
	LVKUpvWGo+tJmo+xQ2e8HeVcq/Lyqv2LZFJrlWuA2KC2jLustgoOy0leJk5nq+tybsv77hjgQaZ
	t2l0HYLEYemSsBi4GyJgvUbdWSPHWU9497Zk1eTE0KAeeYGi0ijzWP7MX8tEHCS++qgXgaxDIf1
	oVxVfBLQ19jMRObjFYiEITn8cozDT9uVVdJFAHBQfF/h3A99IUKcFYYng5k1iPm8+woyxORUaHy
	p7J8iuarHbXve
X-Google-Smtp-Source: 
 AGHT+IE0QZde+Epe2+buYwi8bUzRbiw6UopT760KaBQNT/yzhT5tCfljAa1efVVvg16bHzl1CBMsIOBMC+pNmmJp4w4=
X-Received: by 2002:a05:7300:4f9b:b0:2ac:2b5b:a567 with SMTP id
 5a478bee46e88-2b05ec47be3mr12709409eec.6.1767142641302; Tue, 30 Dec 2025
 16:57:21 -0800 (PST)
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 31 Dec 2025 01:57:09 +0100
X-Gm-Features: AQt7F2rXDZiOi0tvyImtpIeqTNnWRIevRIzoxoKtqPaxAjroJ-SuGGV60E857XE
Message-ID: 
 <CANiq72=ti75ex_M_ALcLiSMbfv6D=KA9+VejQhMm4hYERC=_dA@mail.gmail.com>
Subject: ba1b40ed0e34bab597fd90d4c4e9f7397f878c8f for 6.18.y
To: Greg KH <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: RFALDO4IAI7HZT7BEF2UTY6VOO74U2Y7
X-Message-ID-Hash: RFALDO4IAI7HZT7BEF2UTY6VOO74U2Y7
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, stable@vger.kernel.org,
 Nouveau Dev <nouveau@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RFALDO4IAI7HZT7BEF2UTY6VOO74U2Y7/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72=ti75ex_M_ALcLiSMbfv6D=KA9+VejQhMm4hYERC=_dA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Greg, Sasha,

Please consider commit ba1b40ed0e34 ("drm: nova: depend on
CONFIG_64BIT") for 6.18.y. It should cherry-pick cleanly.

Without this commit, one can create a config where `CONFIG_DRM_NOVA`
selects `CONFIG_NOVA_CORE` without satisfying its `CONFIG_64BIT`
dependency.

In turn, this means arm32 builds can fail -- Kconfig warns:

    WARNING: unmet direct dependencies detected for NOVA_CORE
      Depends on [n]: HAS_IOMEM [=y] && 64BIT && PCI [=y] && RUST [=y]
&& RUST_FW_LOADER_ABSTRACTIONS [=y]
      Selected by [y]:
      - DRM_NOVA [=y] && HAS_IOMEM [=y] && DRM [=y]=y [=y] && PCI [=y]
&& RUST [=y]

And then the build fails with (among others, see the related commit
5c5a41a75452 ("gpu: nova-core: depend on CONFIG_64BIT") for more):

     error[E0308]: mismatched types
      --> drivers/gpu/nova-core/fb.rs:50:59
       |
    50 |         hal::fb_hal(chipset).write_sysmem_flush_page(bar,
page.dma_handle())?;
       |                              -----------------------
^^^^^^^^^^^^^^^^^ expected `u64`, found `u32`
       |                              |
       |                              arguments to this method are incorrect
       |

Cc'ing Danilo and Alexandre so that they can confirm they agree.

Thanks!

Cheers,
Miguel
