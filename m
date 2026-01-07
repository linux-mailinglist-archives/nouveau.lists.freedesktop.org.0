Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D14FCFF87C
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 19:47:06 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CBAA410E655;
	Wed,  7 Jan 2026 18:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NeBCbKz9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D520644CA4;
	Wed,  7 Jan 2026 18:38:48 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767811128;
 b=uqIv9r0STCiPUPnKfiZUtQNyPpBj5IEZwunS++kgysiZCUPGVpQ2KaYX8DPIkik1KbO2R
 8UMHeZLEMx/TFkse2pMsjv+FFEf07BhuuVuX+IpajE6JSByB1+/brFBhQj3Dy4oiBMKFGoW
 kanxGhpOBLadxGfQOUveHrM9AHawesoSQWNcFykfWAjCx6rDytpZo5wyFPZetGFBfnQm0ck
 vO3RfNBONeYwc7dwOhoOsO2C8F1BYAyeCk16Ik36tg9NhyDdOjN4Ru5RpT4uKOPZYVJeXtn
 wGw7pFYyCfxspHc/O5vyt+zA1x3am1dZo9HENXdRbvmUHNL5EJFUhugq70jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767811128; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=A29d1axUawBifPNYBu9EZmIFQDZxZlhkUAjT3K2idRM=;
 b=jm8qJCPQ2umle3KKkAdcsb+am4kTfJMtfmtBcknd6zJZvDFyiXiWUu2exf6rIpR812TYO
 ubJxj+GwZfVB2qTV4yi0EX76zDbtdVFIdvM6Jd4FYnMi4cgHJTeScDxRxhNFgfWXldF0lAv
 he+BLUhy3EyWlg/5cCbmGbqCa6CL/rbyGSsQCjWMKuwq2XvtP2Mx/WsQFWwWL3z3LyPxIyJ
 gJDwS58Ds6p9h6MBK3+5iyOz1zqQPddlfKrq4BFjtcWOV+cWkRXaFAegtF88QzHrt6tQSLP
 mk2Aa3QFQTPiwpn0d96295KkVBYGdnwP96wVl+ZvCqvgc5/sGmEbSNPsK0Ng==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 86DFF44C9E
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 18:38:46 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 394D810E15A
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 18:47:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 422A960007;
	Wed,  7 Jan 2026 18:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C852CC4CEF1;
	Wed,  7 Jan 2026 18:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767811621;
	bh=DibBgRBaACVLcQ9IOd4ZENP6nWAU9Djio8RDETTMxnI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=NeBCbKz9K0DWoMhoQyTqiVoBbIvi+v4bQBJDXsK0yv3t4ZBDVFv8aQmNeA8RF9/Bj
	 R67uAcLM59JVMbxTvr60riv9POimSA/CBJZPXhI6svYY8e3sGsa75XGJ0hAqQPVIdo
	 2j+Fgu9yNQ40y5BtlHoX8GqJcc973gycynO0w/5gwtHwj37q7uV3Fr/a/mZUgEC29f
	 ngvX+mk2o6vzXPExlFW6FK6d0bx3X3n79UMePBJqxvRxn2eVA0wTgkk2H6ThzKDqP+
	 qlEgLIdIJeht0n12n9DLYu/bQ5HGIS8tCG8Cicwj9Q8RuqsBcRPdOis74MaVemSalW
	 AsX5/aA+OMMnQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jan 2026 19:46:54 +0100
Message-Id: <DFIKX0D35T6B.202RY6VMN2ZHP@kernel.org>
Subject: Re: [PATCH v2 0/2] gpu: nova-core: use CStr::from_bytes_until_nul()
 and remove util.rs
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260106035226.48853-1-jhubbard@nvidia.com>
In-Reply-To: <20260106035226.48853-1-jhubbard@nvidia.com>
Message-ID-Hash: NXAKGYCU4YIL2LJAJXVQHM2L57J7TKPY
X-Message-ID-Hash: NXAKGYCU4YIL2LJAJXVQHM2L57J7TKPY
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NXAKGYCU4YIL2LJAJXVQHM2L57J7TKPY/>
Archived-At: 
 <https://lore.freedesktop.org/DFIKX0D35T6B.202RY6VMN2ZHP@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Jan 6, 2026 at 4:52 AM CET, John Hubbard wrote:
> John Hubbard (2):
>   gpu: nova-core: use CStr::from_bytes_until_nul() and remove util.rs
>   gpu: nova-core: use CStr::from_bytes_until_nul() in elf64_section()

Applied to drm-rust-next, thanks!
