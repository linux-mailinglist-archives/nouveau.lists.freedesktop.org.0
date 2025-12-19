Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2C0CD0AC3
	for <lists+nouveau@lfdr.de>; Fri, 19 Dec 2025 16:59:52 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B135F10F047;
	Fri, 19 Dec 2025 15:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kDXoTy4J";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6FD0C454F4;
	Fri, 19 Dec 2025 15:52:17 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766159537;
 b=liEHA7sMMhuAiosMKynfgtNcPu1LsTVv14UxMqfs2gWA7hGUNQVt3LKsDsuQUSrZcOl0R
 aNSeAoIYSTj0CQ8fEJnB+kFgTflgNKiRxMht3eI8RCfQ1s9l3UTiNHyjlo0lCNSGLC6BVhs
 LOHzShbGvun7YEvQx8SPG+gwTAFgmUGVudGdJh+T/prQMozia5g7DTOFy6cTLMOz7g40mG8
 SxCCOotum20O+toIQMn9TEvfF13Gz++NpbTZGaqaiM5Lrwzg6ca8zfT7zabQgH3X5swfl/j
 Lvk48i29P6PinDNtsFKq2/OsnLDNoar7SwBZI9X0/wszs4YFcdu3KA9M1RAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766159537; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=IKABffyNvPjVM+RzIL5ZAgHEXRXD7t+eDtpJ1JycBW0=;
 b=urNucG89U5DZ8dDAGLFzxRlxChAVRLGO3pJcLtO+JxqHZq+kZnZp8zbgmNtrZ24BCg80S
 O40uJePtiuIOWFVY5//SFUNrbmFJEsp073Hw1rc2Cn3ouq1U7mJggkVo+ql63FfL+/sWawX
 rTSk8cwZyoGKIv/CvFLF8sqNXSvm9FgE0MHAK6JEznpreoKqPGyeOEcxfZa+6MP5UrMCjSF
 glGcu3fmObfqafr6es9MDg+c1ZTu7HRW/+diKEuSHya28RPtykXGxmOyrN5Fv/6MAMq07vT
 n6hUUZwpce0YjoOGwLzBhfdOcP0NtaYJyckWjIXeM1k8I1YHlBSikgKiNHig==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id F215F44B96
	for <nouveau@lists.freedesktop.org>; Fri, 19 Dec 2025 12:17:43 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9C0EF10E481;
	Fri, 19 Dec 2025 12:25:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5651560018;
	Fri, 19 Dec 2025 12:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DEE8C4CEF1;
	Fri, 19 Dec 2025 12:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766147115;
	bh=IKABffyNvPjVM+RzIL5ZAgHEXRXD7t+eDtpJ1JycBW0=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=kDXoTy4JgoCQtYGg5/UHAbHNxZs3nuql9kLRBlRL08h4OgY6WohVAyq+6n5wjjjN4
	 ZZ7BAsk+IxUf1OAJjfMLqsezJMiZTEDLMokOj+3p+oBqXBpbXSgX/PHtilfEzw0blp
	 hI2uxR66pgVguorKq8YwmkyNG+YJG6ntsL7+PVOPC7iiav7mLXlrZCEYPzpNzwglj3
	 LtPOVO5vSqBa06DClUFoH9b/rDV+mK9q3/3hxSbYNNEaKu+VQftOBZpinqYnnaPBwT
	 5O4vVWnTHYIEwcwdw47DpyJQ2jk04fUUqn/U+WPbVnna0WAAaaMD7NYx91omtEqNg+
	 CM2oilI8Y6E0g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 13:25:05 +0100
Message-Id: <DF26WBIDPMPU.3E6XTUPMZTHW1@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 2/4] drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and
 staged mode
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
 <20251128-gpuvm-rust-v1-2-ebf66bf234e0@google.com>
In-Reply-To: <20251128-gpuvm-rust-v1-2-ebf66bf234e0@google.com>
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: LIAW4Y7IHI344QAOTEE76FKKN3LQTTSY
X-Message-ID-Hash: LIAW4Y7IHI344QAOTEE76FKKN3LQTTSY
X-Mailman-Approved-At: Fri, 19 Dec 2025 15:52:12 +0000
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
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LIAW4Y7IHI344QAOTEE76FKKN3LQTTSY/>
Archived-At: 
 <https://lore.freedesktop.org/DF26WBIDPMPU.3E6XTUPMZTHW1@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Nov 28, 2025 at 3:14 PM CET, Alice Ryhl wrote:
> In the previous commit we updated drm_gpuvm_bo_obtain_prealloc() to take
> locks internally, which means that it's only usable in immediate mode.
> In this commit, we notice that drm_gpuvm_bo_obtain() requires you to use
> staged mode. This means that we now have one variant of obtain for each
> mode you might use gpuvm in.
>
> To reflect this information, we add a warning about using it in
> immediate mode, and to make the distinction clearer we rename the method
> with a _locked() suffix so that it's clear that it requires the caller
> to take the locks.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Ultimately, the two different approaches of obtaining a VM_BO have always b=
een
desinged for the two different modes of operation -- great to see this refi=
ned!

Given that, I think it would be great to update the "Locking" section of th=
e
GPUVM's documentation and expand it with a new section "Modes of Operation"=
.

Mind sending a follow-up patch / series for this?
