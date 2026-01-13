Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C46D19219
	for <lists+nouveau@lfdr.de>; Tue, 13 Jan 2026 14:42:27 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0694D10E4E1;
	Tue, 13 Jan 2026 13:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="esyuXr47";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1F22044CAA;
	Tue, 13 Jan 2026 13:33:57 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768311237;
 b=nWXh4Y6WXhCDkrLssGkgqpvFAKTwDBgha6YfeJVvzHTSGtpLOUKJZEH5ahCMJFlQr07qm
 khjahF52epGxpsUfmgjcShuvcuB0rJ2UUdCDOIb+hZRYtdN4B3BAoTk2uYVJog/krsDJQkU
 11EsM6g3keHE2go+RWSnSHp/4/+gD65nht11qgiSODkwm1B4Q8VPb928xoIZimd9YB+Ry9j
 qont33Bd7jaRu+efCpVn/4tr+FDwMYH/RfuS/qxSZ6b1PC/pJiBsG+6QFLoKrFe5II76dHr
 ed20L5W0TR8FMNG3nZGKNDGQC+BkzZOgxqI3RThp5q0pycaNpR80ayWZNCqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768311237; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=4tW/Arq7fPhucDDsPWu8tE3xJvIh8SqGDtBsEYdx9Jk=;
 b=s551eGmtuBW/yys8e1fkGi1qGDbgvJjQC+AmLLv7d0rHGi2aW5FpxFTWETwTfukw1B4fK
 xR5B8ijN8KeZdGdUVwzGUYNVjY/mIzzAxhJ/1EC5uHBrKEai0Wz9gTKJnAU/Y65q5X8wEzW
 MD3xGDMmVU5EvI8jv+FmsjMKVHHKResf7JPh6rY5bw+JVMdk/KRhqNDafKVbzTqZ+v/ivJt
 ioPab6Of5okcNFK3lgH5QdyOr1Y7VnM4zY3ZzscLYmMSVVYQrJV+9IQRWmyXDJaWfPCmNv+
 ODvICpV2VsYPgNDygMK96jzFJqPeD766TR5WBItbeRwCLChhx9RePfJfLEzA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CF35944C99
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 13:33:53 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com
 [74.125.82.181])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 64F5A10E4DB
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 13:42:22 +0000 (UTC)
Received: by mail-dy1-f181.google.com with SMTP id
 5a478bee46e88-2ae5283dae8so258970eec.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 13 Jan 2026 05:42:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768311742; cv=none;
        d=google.com; s=arc-20240605;
        b=Lsr5/JLQ413VBewRxyqFdXks54hgKKE9dEJxsdV5qXiZbdnUQGiR7xgcIufq9lhqv1
         fei6AtDTsumzRs80UD8LvQhWrec6aD11x+T2E2NDP8lxxuL2XAXher+Pvlro3UJEZsKB
         3PLQBYPCt82Yf1lbEa/1LHfoTWy6CR4U9WsHVuIS6B+cyY45QKB2s0f2UErGwQCr9qt5
         EZPiGggoNUQwd7tKgbKOOM75oZlk4kFol36o5FJD3XuNtOSnVPHx0r+HY0KSeiI4hDIP
         QFguUPmw/sRb7HRVSIOwtaMse1cq8bolO5NdcNGEURTphoEzEnptgQ6YpyyXOP7qhXjX
         SrQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4tW/Arq7fPhucDDsPWu8tE3xJvIh8SqGDtBsEYdx9Jk=;
        fh=JbB4YpeTQrXmeRbGQnGjIic+xnq1RLlFVBmjDwRo578=;
        b=VjBfZJgMVnPrsq6/BmwDpvnfDxP5FTcMrdCCEGK5Z2sOAzd52MQj3ASR0KWoRR0Uax
         dnCxoQvlKoSNmDXAAlTXV21zAuUn35iJq8t6rjscjSGwCpVT+HBEM7x4/ZP0JfIytq3v
         yNTp/0g/Z3Mln6xk0A8I1e9i+rZv6R/ENRgf2f4anYZi7fPdXVFP2AayTTpaMqcVW6fN
         W1rBnugal/NLRZKuS6GI0grAxBEQY++j/xhu+HKzDWLKffXw3uiegfjy/9FEmlXegGYS
         jZVGPZJ9gNiW0ohlASdCeIjys9fXJhaL45LtULW2DLpB+nysdeQ8HJ379Ov4LZUTUxkh
         NNBw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768311742; x=1768916542;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tW/Arq7fPhucDDsPWu8tE3xJvIh8SqGDtBsEYdx9Jk=;
        b=esyuXr47btKfwJ34nppIePMeA40DpQnhkysu0JdlAg5yAlOLsNM5TDCr+6LQ3pmsXG
         bsoSTSScmn+LhsL6mFUy1cuBtMfEF0bymJxrupH/NBxoSG6xGDpyrtPvedeM3G1OAIri
         hLOreTya5NwkLGgWEdqMnUWSgZha6M+MxxPF/4uC/KqHa/xaFImdfhivQ8xDo9ltt28x
         Gf/AmDQYM/f33WSmJP7O1CLH+H+RmW0kPrGl39oICwWkNpNrc6XajL7QC8QQiN7uuiOC
         uwAl4Ewbfdp3RNgLBMYQ6BqXEZtt8D7L7bzHDXpMAtHtG3jZbvRc52S/ZLQ0RsIBXngG
         4orA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768311742; x=1768916542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4tW/Arq7fPhucDDsPWu8tE3xJvIh8SqGDtBsEYdx9Jk=;
        b=rQLkRFcqqVQQbtE2HWLRzd+jFyPI1xna5/V5oU7HT17joW7HJH+Lbp+JXPHkDRoSpT
         3ICWyozPkiZgEtJsee8m+I6iuUFiK5rtcB/iSyZr0yErzBlO73IVh4GFXRrlmc7YHxNG
         RNMIjRcbo3Jmb99E8D10aodSUIiWHpmi9rGLHwTd/Cde/zLa35TVz/4wocMZSUYJNjUp
         r0YBLgGZ3kPBOpmruYFNIJX+Gget2Jyot3sp6VTYUxsLgrqtqmMnCkK21CEmwZObM5ep
         UW9ppJjevXK49qqBh6r0vavDRjf/IVCSlXxzuwUP9RnFj6uLBDnkmin0lnfkaHtxzI25
         QL8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpg4FOf8Zkdas4T1DxSL/8CcSph9qsyHCfuNMYDJSnZf26x2Z1EWrgwY9PL9YlRprCpoVL54Yn@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7/9ZVpbKArKbOhV4R9IT2NGLBJMGjW/b48Sw1CrBE/qR0fgKm
	fFIaynR6274B92gZh96kTzIlROe9/Qjlk7jX8LPcw2Ek2xI2YUmt9LNI8Rd3Gj2srx7/Fw/KH7k
	6nqx99UFCVS0iP8C9b2BaIvBRbeImODk=
X-Gm-Gg: AY/fxX5Kmnfs5kUvxxrdG9yfezC7FH7S3V/IrgSOHOCkId59G6+MAwuoSTzzluT7PKM
	T5lKUyqkOyJeYCLDdNpxl7DdB8FIj1fpnIcDlmnjNGQiLhyMEcIZBOGo+vitk/yzOi6ZzjjrHAd
	LIot4qmJCND9YU98AUDNJYKjr4wdaYcr0l53LHRt3lZdKLwAPhJytzSoLrqbep9tAFhGOUJPzSC
	LQSBQcckSCUjKmXB4/GbImXK3jEcSKp6YRnV5CNJkfCzIBaknGc+8yCf5bFootlxhCOzCX0jGVr
	JMDIElP3QVReBqkuSo+Q/J69Y32LenBKOaGIHK42CxaYabSaWqo2+HOEU8GDWkcuFYjxryzYd/k
	ZI/fod7Y+Yohp
X-Google-Smtp-Source: 
 AGHT+IEajQnCdX5ZisGRdExe0O1ic9/ebxlyg84D2VDprur2Zw4fiWmbUwhJr67eqmLmFEEJ70U1FbHIhLJwseAJBuc=
X-Received: by 2002:a05:7301:2990:b0:2ae:5abf:ecff with SMTP id
 5a478bee46e88-2b17d31bf67mr8215846eec.7.1768311741413; Tue, 13 Jan 2026
 05:42:21 -0800 (PST)
MIME-Version: 1.0
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-2-jhubbard@nvidia.com>
 <DFNHWA9PXH5X.5HWPO3GQPX6R@garyguo.net>
In-Reply-To: <DFNHWA9PXH5X.5HWPO3GQPX6R@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Jan 2026 14:42:08 +0100
X-Gm-Features: AZwV_QjSJgThpHi1P_7JHl1wPop2X8OFeuu5lrHMB3m7CgKzXv3yTd1NXMxwV_g
Message-ID: 
 <CANiq72njAx78DMdfB-hai73YW6_DTgayyR024rUpPfbDbTbqhA@mail.gmail.com>
Subject: Re: [PATCH 01/31] gpu: nova-core: print FB sizes, along with ranges
To: Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: PXH5FX7QB2LEV6H4IWCDVHCRLRMVWA3M
X-Message-ID-Hash: PXH5FX7QB2LEV6H4IWCDVHCRLRMVWA3M
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PXH5FX7QB2LEV6H4IWCDVHCRLRMVWA3M/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72njAx78DMdfB-hai73YW6_DTgayyR024rUpPfbDbTbqhA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Jan 13, 2026 at 2:28=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> How useful do you think this is in general? Would it make sense to have a
> dedicated PhysAddrRange type in kernel crate that provides this feature?

Related / to shine some light into this patch:
https://lore.kernel.org/rust-for-linux/20251122055256.264180-1-binakugent@g=
mail.com/
and https://github.com/Rust-for-Linux/linux/issues/1204

> I would either just use IEC prefix "MiB"

It doesn't seem very common yet in the kernel sources, but personally
I would like that.

Cheers,
Miguel
