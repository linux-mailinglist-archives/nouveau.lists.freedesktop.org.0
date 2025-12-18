Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F1CCCAC64
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 09:07:08 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 63CDF10E584;
	Thu, 18 Dec 2025 08:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="v59CNsks";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1881145670;
	Thu, 18 Dec 2025 07:59:37 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766044776;
 b=WbkHsSuhFO2Pv/wh1rxJB95BsHVXXqVEhCqyNoNnKwzynZ3GMak75GGluhy9Mv8054MPT
 nw5Lrra37S0+1iWWBT4YS8dejXNN2uhDQ3NdFeq1r1nCUm1h3LIiwxk5xbZs24ijXfVhlgo
 met4Xxljo+jxLOsWRsgSFLPT47S1XfALERTVTmpy1H4fC0VWwfRpJ809fQxn292+5I/0yPa
 NrVOtVGynbo7Hfw4u8pb41SjE9fna/qdN20aFW1tLuHrRgrVwFoRda4ya5JfeNL0OHxG6Su
 gDFx/CY8D0u9aoyAxm8xvZ49UefV5LakAbyrVhrGQECws71Y4dBtaCORjv/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766044776; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qg1cGDg/XcEy9MbpLdRERFNOIZJLJnBwZuR0lpXVu+U=;
 b=1CLGG2/gbc6EPFTXu1t5mk4v1QoSHMX2dXVRdW1NvSMUgfIUZlRmL+aDLp8544wOAogyv
 BwusKoE4wVy/C0/F9ZjqUIdnQ+kx4lSZhSa04V3JjDS6S1ccq9f5mO191HAI10woDOCeaiY
 Bb7ciV/kE8ifq9wUirf+cT0YVsE44EedOEsZt0tYJY2TKrl2qD1xWt5V4ZlJ03sRV2CDkRs
 v1kf955LiGXMoaDmFoCj26RZIJm26JXmkg20ns9vBIJOYmAU/P04axwTjuE2IYl2LeAuMap
 mzMw8jUq1nQ1gn5OiYxliLAID7utqLY8VsKFnSrxB+9aTSNCjJE+Pje2i+uw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id F3BFE434AB
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 07:59:33 +0000 (UTC)
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 257E010E2E4
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 08:07:04 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-430fc153d50so202061f8f.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 18 Dec 2025 00:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766045223; x=1766650023;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qg1cGDg/XcEy9MbpLdRERFNOIZJLJnBwZuR0lpXVu+U=;
        b=v59CNsksEOVnF/5z1rxEd34CN6nnPFd72EoIqCZOBeMhUevNkMW2TXCM7ENOfa8hZN
         Zr9cqYjkPAFvwekYlUM2AVAzBHoPrXxit4zEop4bjMybOvT+zGVDTqLB+P5h5eRMLUps
         e8yszaBk8RtxlDkqjblGK9RnbAM3Po2kCauYNCtMIqTj9PKAhLNSc8PLboxsuJPbwpwS
         aZCDwE7DZxd4P/drnHcw78D9qfNwYwHhB7z/qHKb0uXC6qRYAvqBWsSECizx2VYrtndB
         deRMGNppzFN/a3wHQHa4oXPwlB3YPqrwqsJq4fmnHuKskl+icVkPSbsnVWOmsx1VocI4
         q01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045223; x=1766650023;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qg1cGDg/XcEy9MbpLdRERFNOIZJLJnBwZuR0lpXVu+U=;
        b=QEjK/j4SB1cZgAHt8K9DYMGditMNoLY6R6FFGduYYxv7FhcmJq5TshKBJbWUfNcp26
         N+WUJQLRanGlnm9WvlAM0X+K3PqJlz/Q1D8tL+FzC9pkv8AaxTdkKl4Yn4JVrSRTvXRv
         uKSsty7Mm66NNo3AlJ95XvRY57853SFkIP2Gyk6XFFqLI0s7Ublti+bXXu35/2eCdsXr
         zJ6XvcJZmlOAT0o+L7O2fSJdswbetnJeOB0ALovF+sBOJvesW0I6pIJ43AM6xDlEBxsx
         Clrj3YnIYpmuu1eAy+Q+QG+L2DJzFSLYQdJ1a3aEnhgrmjWteLQVbqIFusJpJy/Imwn8
         8ilw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYOYp+P6lr5ET+W8LKcG+bX3ExxSMdHH4BO1Zk5CWRvxp74993A8Ci10dooape1hK4dBpUObEB@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2sZdoPr9fTRCAhzMyF0y4GNTQSWyBeGhh2eFEhvxz5CeirVpI
	O/vOaNbvGhvgAMeJjPplA35IkJm6QW+0TRKBzbLSxqt4te3SYWUfVh/dm1MmH9cXTxdxKnBlMMB
	HsA2BsvjlFR3Y32/PsA==
X-Google-Smtp-Source: 
 AGHT+IF5w6LVSb0ax3/S2dVmFVgIUXrG0XjB1uE3WTrfcwrF/0IBI/cW/AbG+aiSiwbTIiCF7VOsHMCPE5It4r0=
X-Received: from wrbdr16.prod.google.com ([2002:a5d:5f90:0:b0:430:f277:2ca0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40c9:b0:430:fdfc:7dd3 with SMTP id
 ffacd0b85a97d-430fdfc7f4fmr12849438f8f.50.1766045222701;
 Thu, 18 Dec 2025 00:07:02 -0800 (PST)
Date: Thu, 18 Dec 2025 08:07:01 +0000
In-Reply-To: <20251218013910.459045-1-ttabi@nvidia.com>
Mime-Version: 1.0
References: <20251218013910.459045-1-ttabi@nvidia.com>
Message-ID: <aUO2JZR6soTBLtLQ@google.com>
Subject: Re: [PATCH v3 0/9] gpu: nova-core: expose the logging buffers via
 debugfs
From: Alice Ryhl <aliceryhl@google.com>
To: Timur Tabi <ttabi@nvidia.com>, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: AO3JEDECVVYK3RB6CNABKNQIQIRIBEKI
X-Message-ID-Hash: AO3JEDECVVYK3RB6CNABKNQIQIRIBEKI
X-MailFrom: 
 3JrZDaQkKB_ETebVXkraeZhhZeX.VhfghnoXTneblml.YkXXWXldmhi.hkZ@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AO3JEDECVVYK3RB6CNABKNQIQIRIBEKI/>
Archived-At: <https://lore.freedesktop.org/aUO2JZR6soTBLtLQ@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Dec 17, 2025 at 07:39:01PM -0600, Timur Tabi wrote:
> GSP-RM writes its printf message to "logging buffers", which are blocks
> memory allocated by the driver.  The messages are encoded, so exposing
> the buffers as debugfs entries allows the buffers to be extracted and
> decoded by a special application.
> 
> When the driver loads, a /sys/kernel/debug/nova_core root entry is
> created.  To do this, the normal module_pci_driver! macro call is
> replaced with an explicit initialization function, as this allows
> that debugfs entry to be created once for all GPUs.
> 
> Then in each GPU's initialization, a subdirectory based on the PCI
> BDF name is created, and the logging buffer entries are created under
> that.
> 
> Note: the debugfs entry has a file size of 0, because debugfs defaults
> a 0 size and the Rust abstractions do not adjust it for the same of
> the object.  Nouveau makes this adjustment manually in the driver.
> 
> Based on Linus' repository, not drm-rust-next.
> 
> Summary of changes:
> 
> 1. Replace module_pci_driver! with explicit init function.
> 2. Creates root, per-gpu, and individual buffer debugfs entries.
> 3. Adds a pci::name() method to generate a PCI device name string.
> 4. Adds a lookup() method to debugfs, so that the root debugfs entry
>    doesn't need to be a global variable like it is in Nouveau.
> 5. Makes some updates to debugfs core code.
> 
> Alexandre Courbot (1):
>   gpu: nova-core: implement BinaryWriter for LogBuffer
> 
> Timur Tabi (8):
>   rust: pci: add PCI device name method
>   rust: debugfs: add lookup contructor
>   rust: debugfs: add Dir::empty() for no-op directory handle
>   rust: debugfs: fix Dir::scope() to not borrow self for returned
>     lifetime
>   gpu: nova-core: Replace module_pci_driver! with explicit module init
>   gpu: nova-core: create debugfs root when driver loads
>   gpu: nova-core: use pin projection in method boot()
>   gpu: nova-core: create GSP-RM logging buffers debugfs entries
> 
>  drivers/gpu/nova-core/gsp.rs       |  66 +++++++++++++++---
>  drivers/gpu/nova-core/gsp/boot.rs  |  15 ++--
>  drivers/gpu/nova-core/nova_core.rs |  29 +++++++-
>  rust/kernel/debugfs.rs             | 108 ++++++++++++++++++++++-------
>  rust/kernel/debugfs/entry.rs       |  49 ++++++++++++-
>  rust/kernel/pci.rs                 |  37 ++++++++++
>  6 files changed, 259 insertions(+), 45 deletions(-)

Adding Matthew as this touches debugfs.

Alice
