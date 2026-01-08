Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2B6D04EAC
	for <lists+nouveau@lfdr.de>; Thu, 08 Jan 2026 18:24:19 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 95E8810E7AF;
	Thu,  8 Jan 2026 17:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XKyAyKs/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7DA1144C78;
	Thu,  8 Jan 2026 17:15:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767892559;
 b=XU5qtx6dwCmsZaDtGn/A9NR2l/wG53v8gP8bY1ZEjbizYixBYQUCaZNzC7hUe+Ds5yNea
 FgYhtG6NznCsxL3YKqCkHQl676Aj1A1Z+0H6yJ5W1tBS7LYF7qHgLxMfMDLbrxrg8GrT6yA
 6nqA/zN6QNaYFSs+c6w3jxtgpEQAiivqSc0PJY9dyrooaaFGWrrHZJWJnwDuEBzuuFhXrDJ
 kpvUpQ1PElU6BwZnag8RPIBcIUCNPp2HGTO9BEm1mkuvkY9Mut2bTq3XQsrGfyBGNzhfda7
 P6wGpG4XOB6FbiXhNhLRa/GeC5jTKH1eghdNMrTVVKOMlPROxURua7nEjhiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767892559; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zSuVpNfCQfWY9KoK6dNvDYn5qhzCqogN/zPe9eNlItM=;
 b=Im+MHLvDA9J+epFVIIkpLUZKSKbHM19OAd6nKRckvJYbT7XMnBl4AkzoszhxFIe7GNPeR
 VZI6PfqHT5LT3r2yWY2adliiIrkoZrAgl7crfqRMfNJo96fecfopUMYP097KKWHtoxZCZ1U
 g7XOshwWcw//fwR15+Jpc+/cHvXx8AJzHKmxgCVVv6hHYVpE2QVGEwzklWxBKVMN1S+oio4
 kra8Kgi7HDAALGwUfdWYTWQxCS7CMkvKDd1JsBXNznNce2Uf1hch97Qhp7M5iOiHCIJ51zf
 hJ+7XcFUDS7W2+0/Iyb7FuGJCs6Nr7SD+gQ/kLYz1Gj7o/9cm6FkiQCtmCnA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3AB3541ABB
	for <nouveau@lists.freedesktop.org>; Thu,  8 Jan 2026 17:15:56 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D12A010E7A3;
	Thu,  8 Jan 2026 17:24:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F5AB60130;
	Thu,  8 Jan 2026 17:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA179C116C6;
	Thu,  8 Jan 2026 17:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767893052;
	bh=hq0TVgPrc0pom/V97hgluSg19lH8GAucG7MJGGWa3KI=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=XKyAyKs/CwbFCuPL7zO2AjeTOhShG2a3lDcM2MJrb7R5/ZhZnwSoE4EiuNOoG4fT2
	 un3qnNrPHUot6XOKHiudxgPiDSFf2cKH/uCP9lGfsjMMu83Qpa7Mn2fuH34c9NXQtm
	 2PbE40s9olywJM5M5kNdzMaQu9qO2kcfCGkYfxT5hC2X5xcnf14EsoTiopz3mE333m
	 a4bZM0MB/8sxuo36fNWu0R8BcVkdDX69B/r/v7Q+NdLA5Otpp5ts6Bdvlb4EKETINs
	 2Lidp0s1+l07wnXzjH6Z3N7OT3XP39NYbpZMolhrVdwb/Sq1cUdE+AXnKpG/65s/O0
	 jChUimgAy7L3A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jan 2026 18:24:03 +0100
Message-Id: <DFJDS4EY28HD.WZ344DONCS5L@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 0/3] Rust GPUVM prerequisites
References: <20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com>
In-Reply-To: <20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com>
Message-ID-Hash: H5QYQL6XD2BMF7ET5HHHMISGMD3LDOTP
X-Message-ID-Hash: H5QYQL6XD2BMF7ET5HHHMISGMD3LDOTP
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Daniel Almeida <daniel.almeida@collabora.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/H5QYQL6XD2BMF7ET5HHHMISGMD3LDOTP/>
Archived-At: 
 <https://lore.freedesktop.org/DFJDS4EY28HD.WZ344DONCS5L@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Jan 8, 2026 at 5:07 PM CET, Alice Ryhl wrote:
> Alice Ryhl (3):
>       drm/gpuvm: take GEM lock inside drm_gpuvm_bo_obtain_prealloc()

Applied to drm-misc-fixes, thanks!

>       drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and staged mode

   [ Slightly reword commit message to refer to commit 9ce4aef9a5b1
     ("drm/gpuvm: take GEM lock inside drm_gpuvm_bo_obtain_prealloc()").
     - Danilo ]

>       drm/gpuvm: use const for drm_gpuva_op_* ptrs

Applied to drm-misc-next, thanks!
