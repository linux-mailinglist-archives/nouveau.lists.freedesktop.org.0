Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D26ACCC5A4
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 15:55:45 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E517710EA07;
	Thu, 18 Dec 2025 14:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GiT24CQO";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E875D4564A;
	Thu, 18 Dec 2025 14:48:12 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766069292;
 b=HJ4db7KU9vmQq4WMGI38ukmlKJ6A2FJfQBEWWHhqxo3YJLvoJ2YXl4mERM4f8ouervc7y
 qBl27WdSq+FBVOiXzwseT2zE746HUrBDvNp8/An54Wdo4NTR9U0VdVTmjWWHEtZ6PAefx2O
 toEGLBy77fFYYu55jyhBMnqCUV1Sb5sPbdYLayMYSRtvpDVpTdB+DLL7LBH2TFWFDuuBs7o
 91W9NbhiLw6PeQXKPEYSAifkLPrGRPZ73YZbXMFna4JXQeLmbYjCqj2K/ZUAoRuUPXb08uD
 pzFFqrwDm6WdNaAyvrgHj3GQrTswYJB4aerU6StBQNbhKgGCf8chv8wHgmxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766069292; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jJDWbMPtqsOmfmANdPUFkQwgfGG+kUEC1PVtChahXaE=;
 b=hJwK2p+7J1MlE9pcXPr13a91RiO9BPLucCE9tIfBp6x/BgVL0NF5Dm31Fa/sJBd8aIjx3
 nZ5vMgyvT/NB05XzS34ckBS50xSbOCoJgo0Ke7WBQxhNKXqvn9Y7RP16Mv5yiDA9zi9SiRm
 FqC8mHHSVEO6VcvxipVe835GtWFIC/SGKKeaqrCUATcoDqBS2r3OpPVuLzzZ/IXmBW3Ug6j
 CvzMeGKgMjsork/RtJQpIaK4m2WdA0PURRkHjhR/GZF1R2HLkBy48NcPyyz+36DSK7FjL7A
 /pD7WNFDoih5Pad7nhVMSImm+Q+XCjZZOaryTB+C4JNddpD1uEDx4mWhq6/w==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 432CA434AB
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 08:37:06 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 370EF10E399
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 08:44:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B095643252;
	Thu, 18 Dec 2025 08:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F5BC4CEFB;
	Thu, 18 Dec 2025 08:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766047475;
	bh=zifFDzDFd3xnbQtT56Qnj/xOx5z3VQ11LSFh/5Xp06s=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=GiT24CQOJmTubVtEDgioxHO4vjNDj3b2YxsSI69C+xWKpMcNpK9bUKjWYkxEkwTME
	 joGTG2ekaBHFLs1R4zMkkS3xAZJguVo/HJcfT/2i0GchwPvETXTIPyqZo1385ljb5b
	 1raAoZZNDB/PMfANPhr+xKuEww5vjVPhnL9Q+G7AJvafPK1zkgALR4CLNgRlFo1S64
	 J8LxUAuF65cE7J8Tk/HfKM0EgfY04faS76m7RFkCQP792em7YEJ008jBEVYJND74x/
	 DFaObLEyFR7gljJi030r8BzcUYFvj/o5bfnWdNbuD611Zp2rtFdW7iaQy2R7is+bNv
	 q3WdK86MlptAw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 09:44:32 +0100
Message-Id: <DF17KWDOWIW8.3KTSJU30CPIMF@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 0/9] gpu: nova-core: expose the logging buffers via
 debugfs
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20251218013910.459045-1-ttabi@nvidia.com>
In-Reply-To: <20251218013910.459045-1-ttabi@nvidia.com>
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: CI4FFPB334L4FB557E4LULNS6AVEGZOS
X-Message-ID-Hash: CI4FFPB334L4FB557E4LULNS6AVEGZOS
X-Mailman-Approved-At: Thu, 18 Dec 2025 14:48:10 +0000
CC: Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CI4FFPB334L4FB557E4LULNS6AVEGZOS/>
Archived-At: 
 <https://lore.freedesktop.org/DF17KWDOWIW8.3KTSJU30CPIMF@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Dec 18, 2025 at 2:39 AM CET, Timur Tabi wrote:
> Summary of changes:
>
> 1. Replace module_pci_driver! with explicit init function.
> 2. Creates root, per-gpu, and individual buffer debugfs entries.
> 3. Adds a pci::name() method to generate a PCI device name string.
> 4. Adds a lookup() method to debugfs, so that the root debugfs entry
>    doesn't need to be a global variable like it is in Nouveau.
> 5. Makes some updates to debugfs core code.

This is nice, but given that this is a v3, where is the changelog?
