Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2518BCD2CC8
	for <lists+nouveau@lfdr.de>; Sat, 20 Dec 2025 11:01:55 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F2B6610E222;
	Sat, 20 Dec 2025 10:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="LlFWCAG8";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E2F3945649;
	Sat, 20 Dec 2025 09:54:16 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766224456;
 b=O9WDgDYAcQhYX40YMZQLEPcCABFN4fNcCUjqqeAyytUyphI+bjbonEBiwhb2M8gXd8A3l
 p4w/MoDmbX/jkVSmJQFdeh9N73zlcqzDWGqVJoPxvzqH2Q5gLUtRQrscWe5Z5gaazR4KleR
 c6uWCEKJqB4ZLQTq2E65FU7/g/GL258DWEkyl7GesUtt6sRPFigN4q+/XZo0JeIutRewsgr
 Q6FeIJKMdcAT+0s/MQIgbcPWeR/6gVjz8nbTVQYuzEeHBOHgFD2Czsy8nGzIkkzgk6ZyGPk
 t83qvpkw9M3TafF4EWgbknlPyQfUng7EIDNqoXbeJKX6bR3mwaO/B2+YrFLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766224456; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ocwPq1u4g2mzhV09irHynQ5ZI4NxkFIUPpevQXULN2g=;
 b=nfp6QdbGtgcPuDN2JpF8pjTvxQm/Bf0FU7rf6ogk5zLS7Gfb6bgyRSrareTrrXEaKx6AF
 GYZVqIC1OoeSq4DtvhhFVjAqYfPNs+lcfSvVmvsVdbJLeknFi1FdjjR91CQ9qjW+13mUvfE
 3ZKJ+PZLUS9374GtTZEGe3c9pbtoYiE4DyQahiJ/+75Ly+DMLDJ0BExwLdauh6aQHkWxkGp
 kQ7dLHrnNe1yY6hhAxydfS5rX1WEWYGQKJAShNg9/oDTgejYzn+b4QpjXxly0ZSWpmxY8VJ
 hcCSXdMxRNkzcWlzqEhJN59sAOEvYusDeyGZQNsDMJCmWn2yorHbmb/a6IsA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3CF32440A9
	for <nouveau@lists.freedesktop.org>; Sat, 20 Dec 2025 09:54:14 +0000 (UTC)
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com
 [209.85.208.73])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0083410E20E
	for <nouveau@lists.freedesktop.org>; Sat, 20 Dec 2025 10:01:48 +0000 (UTC)
Received: by mail-ed1-f73.google.com with SMTP id
 4fb4d7f45d1cf-64b5aff9566so3025723a12.3
        for <nouveau@lists.freedesktop.org>;
 Sat, 20 Dec 2025 02:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766224907; x=1766829707;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ocwPq1u4g2mzhV09irHynQ5ZI4NxkFIUPpevQXULN2g=;
        b=LlFWCAG8llx83AYbiqgbw3sb3twEXpKJHaZrOHgfPqD0FbukGfTPlfvHxWBM10Hs8G
         lxKyPoszc82PMrpdpCKYmydRDfaRXjZA4S6CrHgFNdefOW+57iTVz6xxvTWiJLFcE6wP
         //YEe1UA/WQgcVp5aYjPFWfaM4ifpcdlyBEVneQCHNXaB0hjGwdMs7RwBrzPMgZwyVHi
         6NvMP7HHlNmxDLsF6jCv2Rem7CT+CCNg8tgetNmv0iDSxyK1mSzBEW9rMRqlGtV9Whad
         WTjXipTBKvfOQ32U7C4QKpnykUNf0xVKaq5iXnDQl/Y2hvHnE1ej5Yuq1OKk52jA/CvW
         1law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766224907; x=1766829707;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ocwPq1u4g2mzhV09irHynQ5ZI4NxkFIUPpevQXULN2g=;
        b=v3/3z6dvUcPi6eVEyYpMFeXf7pjQzIol9uZ42/odixmBjp5S9Y5wzIGctib9oaihIa
         OLxHUwrBDGuwlo2w31I3dcnJKH52dChcMmOTxYMFFKuhWh7LbHaRlFAWqafZwQkGsKJ/
         3YQX+cPS9tcyQfS+j7wap/TYC7risc18tGgf7XW/1b1EnR567XxgBPWxEZM5+Jucgm0a
         m4qcZlHNR0zj7EEnMrVLXq63WzRZyJb8n7Q0CeFs+LLWMJ0/lqLmxtDS+LKL2LstBgUM
         CikAf2NqFP818uZ+BopaTw6bgjy/QxsSFlpOGScn/WGRunD40SZ88ZMfe9fGNdlBphjs
         Puvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNQweM/OA+xPq2eNZYBP1iLzdEsx3qfrQDjtnywwuyR4AXCvQR4ojCx8UFeULZiPL0kotpZnop@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgP1R+BsNFuOovtEaty/zQqS8XHO7+GxV45CAXqAXDhCmHz0uh
	dWmHVIeDUq/5T4IRTHtn96/7qbeBFrV3mg24Zkeovt9PNCCePpgbmwRu1lEP+BGw6S7ZH5uMmo5
	nWWh/dMgUFJh12HJ/kg==
X-Google-Smtp-Source: 
 AGHT+IG5pJx6M7iv4XX9yaURjf8mepTlu7YYJc3wOo7y0QcuEDT1u5dJwGmGqq3CfkKzGEqd1szxRNtAfdZCVwY=
X-Received: from ejdcw8.prod.google.com ([2002:a17:907:1608:b0:b72:41e4:7557])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7e85:b0:b73:4006:1875 with SMTP id
 a640c23a62f3a-b803719ef9amr511534366b.38.1766224907016;
 Sat, 20 Dec 2025 02:01:47 -0800 (PST)
Date: Sat, 20 Dec 2025 10:01:46 +0000
In-Reply-To: <aUZw4fpWRUWFsb9r@google.com>
Mime-Version: 1.0
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
 <20251128-gpuvm-rust-v1-4-ebf66bf234e0@google.com>
 <DF2AXQ67412G.33JOX2CF0VFCK@kernel.org>
 <aUZw4fpWRUWFsb9r@google.com>
Message-ID: <aUZ0CsLrHjP3wMac@google.com>
Subject: Re: [PATCH 4/4] rust: drm: add GPUVM immediate mode abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: SOC67UFSVL7NY5WGTDLLQYZIS7UQJD3Z
X-Message-ID-Hash: SOC67UFSVL7NY5WGTDLLQYZIS7UQJD3Z
X-MailFrom: 
 3C3RGaQkKB146HE8ANUDHCKKCHA.8KIJKQRA6QHEOPO.BNAA9AOGPKL.KNC@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Daniel Almeida <daniel.almeida@collabora.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org,
 Asahi Lina <lina+kernel@asahilina.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SOC67UFSVL7NY5WGTDLLQYZIS7UQJD3Z/>
Archived-At: <https://lore.freedesktop.org/aUZ0CsLrHjP3wMac@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat, Dec 20, 2025 at 09:48:17AM +0000, Alice Ryhl wrote:

Test email
