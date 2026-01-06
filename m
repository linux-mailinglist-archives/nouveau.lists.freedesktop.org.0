Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE02CFB479
	for <lists+nouveau@lfdr.de>; Tue, 06 Jan 2026 23:44:29 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 806DB10E49C;
	Tue,  6 Jan 2026 22:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KBoBt55c";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 67D7744C9B;
	Tue,  6 Jan 2026 22:36:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767738973;
 b=fa8zdsPVsVY9jpTM13cqoMSkIcEvzdiNq34pv8NMS50s/ibbuWa6opg6fQjr6Q9XrZiLm
 RlH9X3nksxhrzBRXQhfIDD9p67Ld6yY3E+AUG76VrfwUbNsqnAOHpr0yGa5XYlk76YiBxY/
 0a/1DWhP0KDzXlo0wpWpgrlf8ffEKZpptKSNycMLOrAzd9iISeXhSh8h1lB6Ddob0L4GRo2
 McnYYx5kwOOi4bdP6wo0+yTPxo0ETxi57smGO7gC7jNG2yh6o3pfl0kL5O6ToLFdrbPiexi
 wN60vNCCWGu1Yx3opWl3cyUreFvIHgj6j2JVcm0vTeUPc8QQO11ArsiFI8+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767738973; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=p/AOQxeuafMIlCdbG9TVdWKP240AsSr4S7DEOwZgCtw=;
 b=Ur+nqzMResfGmG4rBNjeCMOU7lJUkZ2qpw93ADgeVO79Ktpga8CK197bCi0aass9AvNle
 o0e4vgZ0/mwNciMIaIb3Vbx1vPOAbL7sM+KhFX/BAiGiX5xLagLKYcOvxGISm+bewKIQL3f
 mOJtDr//DekM6xWKOUMlBrty2ZhGwSFj5yKX181aftbtR6s505iM/D5dz+qBm6rHmAI0JE8
 ln2nIW5WBHihQOWcAiCud+n52Zrb9zB2dtQ/pa+gFq4h6rfCM5malKlLpM2HGO61Z1oz6FR
 FLtjwdcSyaeuKRidF3MEq/8gEmbiUhg7DCSEkdSmT0NfV0mbOUEoxW372rGA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 27CB744C5A
	for <nouveau@lists.freedesktop.org>; Tue,  6 Jan 2026 22:36:10 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E499E10E24D
	for <nouveau@lists.freedesktop.org>; Tue,  6 Jan 2026 22:44:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26F486013A;
	Tue,  6 Jan 2026 22:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF847C116C6;
	Tue,  6 Jan 2026 22:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767739462;
	bh=2ab/KARjjTASRxH1G2UQX810qb+gcVXxaHxCsKph2R4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KBoBt55cEK8Z5F8h93u3KInDvV8vxkXbZqDInAEg32+AghOmQRZoYgeazDQPWazO4
	 ZnZSGeh588eD9bLUUFU7Cjj8krNzU5/W86FQ98CXRAtfHN8eokNCvEVMF39if7uUBZ
	 XdBKbYenw3eJRhijeOpiRfGxNrtI5PeMXvBf1MpOwok8vWKHs8ScUQV7gSsl0vMgar
	 Sl+eUU2nwVXpl1bvTt1QrueLgKcZJpaT5JvEd4JV004sG0hL0XYrV9YY2Fz8RqQth3
	 eweZLH8yUkpmhcZxNRB3hElWwz3ceGRHwgbgefhkjUMq5zS37eFRn1qxfWZr50kzpA
	 jw0jFPec1/+2A==
Message-ID: <9a8f8500-aa1e-4145-b84d-7ce424ead644@kernel.org>
Date: Tue, 6 Jan 2026 23:44:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: use CStr::from_bytes_until_nul() and
 remove util.rs
To: John Hubbard <jhubbard@nvidia.com>
References: <20260103013438.247759-1-jhubbard@nvidia.com>
 <DFHHP3LVYW43.247TW37BCGYHE@kernel.org>
 <09e0454c-222b-41e6-a8e5-6d6240b20479@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <09e0454c-222b-41e6-a8e5-6d6240b20479@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZU6TNLJQRC2B2VJIUGDKG5CTCHCQZLI4
X-Message-ID-Hash: ZU6TNLJQRC2B2VJIUGDKG5CTCHCQZLI4
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZU6TNLJQRC2B2VJIUGDKG5CTCHCQZLI4/>
Archived-At: 
 <https://lore.freedesktop.org/9a8f8500-aa1e-4145-b84d-7ce424ead644@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/6/26 11:09 PM, John Hubbard wrote:
> Yes, so that would look approximately like this, I can send this as
> another patch if it looks reasonable:

Thanks, looks good! Two comments below.
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
> index a53d80620468..71fca7350b94 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -238,11 +238,11 @@ pub(crate) fn boot(
>  
>          // Obtain and display basic GPU information.
>          let info = commands::get_gsp_info(&mut self.cmdq, bar)?;
> -        dev_info!(
> -            pdev.as_ref(),
> -            "GPU name: {}\n",
> -            info.gpu_name().unwrap_or("invalid GPU name")
> -        );
> +        let gpu_name = info
> +            .gpu_name()
> +            .inspect_err(|e| dev_warn!(pdev.as_ref(), "GPU name: {}\n", e))
> +            .unwrap_or("<unavailable>");
> +        dev_info!(pdev.as_ref(), "GPU name: {}\n", gpu_name);

I'd probably only print one or the other. Also, I think this should be
dev_dbg!() instead of dev_info!().

> +/// Error type for [`GetGspStaticInfoReply::gpu_name`].
> +#[derive(Debug)]
> +pub(crate) enum GpuNameError {
> +    /// The GPU name string does not contain a null terminator.
> +    NoNullTerminator(FromBytesUntilNulError),
> +
> +    /// The GPU name string contains invalid UTF-8.
> +    InvalidUtf8(Utf8Error),
> +}
> +
> +impl kernel::fmt::Display for GpuNameError {
> +    fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
> +        match self {
> +            Self::NoNullTerminator(_) => write!(f, "no null terminator"),
> +            Self::InvalidUtf8(e) => write!(f, "invalid UTF-8 at byte {}", e.valid_up_to()),
> +        }
> +    }
> +}

Do we need this Display impl, or is the derive(Debug) you have already good
enough for the warning print?

