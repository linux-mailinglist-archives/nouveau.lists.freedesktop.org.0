Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67052CCB4F4
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 11:10:14 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0B21F10ED07;
	Thu, 18 Dec 2025 10:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HI8zsE5+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 79BBB45689;
	Thu, 18 Dec 2025 10:02:42 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766052162;
 b=eyq9HN04HEty8m1gyjuOPRFHG7wzlAI/uXhz2NKklgojaCOJZDluKSe6ujV6nSYsHyw6r
 MXuAKC1ot2sbbATIqDN/B4kEfCRremw5ZiE1/yQStV1hWH0yMLE0QL9Re+U3z2AG+9xd26l
 XiyvxkxKazG8RVCZhyTCCwxfWI+X3r/QI/Omg5KAKw95VQ7O2NKqAkHNnwyFeRxgJmO1WxS
 2HafPgEBxWAWt+kwdByGAdJQVImuG+VJStEeFlNaINcooNv2IUR75+vihdDioG5ugiC6YoI
 6Njc3CbUOmHeCjNqZejl8r2/2kzOvow2CEj7gCIY12xOhPBbyF9GXZnSFsNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766052162; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ShMd5RsgoCCs+7pbJSDKC7+gIM3DjjQQXbLBPRzr+LI=;
 b=ZkODQ37rM3loZyqRbL+MZt7HC0pK5Xege/WPx5Y0dQkoJIifw8VzRaA++yZIRJ8tlDPmV
 mo5O0aA7kVanSigUWkWAS8JiXLkjG5g24q1DkbSGbTByfysPgXY4FO43hnt7E2y1dFdPe7S
 IVZhzmxkfvjTLG3R24I/r0aW547SQTGx2Iat6mhPdvP7hM7xyaXWNY8M+j+Fy2p6iafLEdI
 VGq9d7b0w7O7mrK+Rs/fYiAeob+sOzO5KtxsavLQy0pska6JOs7u5WDbuzD58IDfPZ2j0Op
 zEy6ObhGAjOcjAc6aJ66+ljisx15eDc1NzQqJE33r67bOzLF43bZ9L383m9Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2BCAE40057
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 10:02:40 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7A68810EC78
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 10:10:10 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-b9da0ae5763so17818a12.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 18 Dec 2025 02:10:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1766052610; cv=none;
        d=google.com; s=arc-20240605;
        b=ffXc9kiEOsQEsP4HFXTw6e20nw3/oUjg22ORX3t1XSOb3txypymnw08Lk0UAjjP1+l
         MxKx2CKBNJsUB/fHI+XM2ColkEuixWthhGVrW4IYZYmVU87MBrul6tsTBdnPc8G8gf7K
         q0VdhVkeMv3snazjjNEpbYLv3azl4alV0aiiXbJDKVPLtmDWu4nvrDawXUzSe7MQjAB/
         +XThBQx/LyUDnJ7DntAPOC1iw7cS/ausjySPCq+p1VPQ39H5Hzi7nwDKxhwyUBM/mSkz
         Sym49+WZnrIXTcY6Y3+0XAJp2uqJkelQH2IUH9FaemoTxrgleOxAXwEA8Bz2N++nLrQw
         qkow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ShMd5RsgoCCs+7pbJSDKC7+gIM3DjjQQXbLBPRzr+LI=;
        fh=tGuc+0g7IQRR87wh944lbOavnUSQofLXtazPwupOMb0=;
        b=BQzuvg5/tdm1d7B8reP+SSgV98IcNKMZITsN4GJE6iy7VgcsqbFNDOcS5lDUB7b828
         ENSOKCm0KzQ5pU07T6eC+RmpZscXrQAori/lwPfsNEBgXV7xOjf5Sf4R3wJPG9GTHKAn
         W0IC2VwrCfNEAIausadv0rY3PeuftnHHuT0SAqqWA5C8KKv/Ash1Z1YJQMJd2PiKUhvQ
         ByDC5b5liN4fXMgWv6xfTiHI7NQcZtu7Q8LrGV/v63nMSwqOGQfcIS82KXYuop+ISn8y
         y6SKHa+IHDawCq+6v7FcMKtciy4j9jrKdxw5rzuyM8PqhN80zFu7w4QXToQ1PFG2+gOI
         eXjA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766052610; x=1766657410;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShMd5RsgoCCs+7pbJSDKC7+gIM3DjjQQXbLBPRzr+LI=;
        b=HI8zsE5+/hhMIuMJFJ/u5rToss7A7VRZE9G47dTi2aI8tvm5Oyio7H83sdLrnRWdDw
         7XFJvAe+xlU9i78L9lUFSzunVlQWZM6sXDFrG+Q2Wc/f7R7Sv/suvgRWN1BVpSAD+Wim
         mbTVEbfvmzICGDk9yVm/nb1bnMPU9H06HORyJES14vnYIDE/3uMjtMhF4WqdF3bagyHD
         jXDCp4YYkeack94EqzIV/gfJ1D28VM1jBdJTKGDDCBGv+iHLuKBkGQqd+IhDx1KvzYS3
         Rm8DOMokoL2ozHXLkSTERm4rDwZIutj1YUebb0XSpwzOxjhNsJeZUvlsXrQ1fE576ie6
         MraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766052610; x=1766657410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ShMd5RsgoCCs+7pbJSDKC7+gIM3DjjQQXbLBPRzr+LI=;
        b=LykS1kmyWCSvco4CbZ4kyuak0GWR7zCKo0eN0ZIPn+hLhpp1iglGrQl1pBmltHLRGr
         1KLCZndb4WPx5iL3Vmj1LIJVFk2C5HSNB6BG0nM8YMZlh/HwzDNKoLSRqNBy9pAzD85k
         jt4MbaPVd670br5+922pPwy7JD8+OqSNoow5D1uePipTRiABa9cnuv5upzOmt9zfsmpn
         whkIkDrOBaoar5ZdjmG7wqqDp3fxGkRBajpoCqBFm5+ms6tkHfXJRKiURi+hZjKfRvWt
         OF9W8vX/jfXFc1cnl//5KF6QmyxOv82XRpKmXLuqcT0RC4gTAW0WboE7CHpA/Ow2UP8v
         QqsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjCb4f+szGA5oz/OSeoB8OiyGrdUstpoKSLc6R2oiPveuDlUBksgC4H+3oSv6g74CqXeTUrZtQ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywt4/K0ZGUZRqFzWRuTZQCd0zhuqpqyuxNvtZudc0PXI3bz/ALp
	wiiN2XgMNNuOD09XJyS0eSDwD6slvi7NB6sQryWGRIPvOyCJKdO0dmMiYYDxffurJdJQCcAlQ5e
	6o0NmWt8DE16JhQXrmqjMvGBmdGdhLMU=
X-Gm-Gg: AY/fxX6vGtAdZa0bJQ89rG16/l9R5WWCMpCAlpDeFgik5Mj5sTQG3Q46nxfVOPIrvpJ
	ceNOGtKyaFG6l3hu3b/YAkQsIjPg4IFhP77pUTm621Fdu/T2HvA9Yispa2+URN2GEUCUuxJLIQ1
	D0oz/jVw9p7zjYIZ7yZVmm1So1u4lg8Op97nwRdn/GiAQ7sD331WeIij1z9BhGm+pztFd6hRTTN
	6J7/u12C+lhPW6UWFx3lFkfWkxlNTva/2hA4DLR1tj0xfpOEfJcIbWMki9HwHQvKQ1WnYOe1x7f
	FdUiFP5FnhOblXJmD0XZ/AhYGQMFdtS/zYrlxjOJmLRtcKLh7294IBelsvsMrFRqSAZ5ZQaMmgK
	2u2JwBjvirsswCw==
X-Google-Smtp-Source: 
 AGHT+IHQbBEe6RbCdFHu1fn1QiVN/swj/9ZD0sCwj+fIRULQ2zfxp07+2Vth/JPcNxD7+ZtAGAtVuxSS0clkJ+Xv/rY=
X-Received: by 2002:a05:7300:dd43:b0:2b0:502d:c27c with SMTP id
 5a478bee46e88-2b050656404mr698153eec.5.1766052609822; Thu, 18 Dec 2025
 02:10:09 -0800 (PST)
MIME-Version: 1.0
References: <20251218013910.459045-1-ttabi@nvidia.com>
 <20251218013910.459045-2-ttabi@nvidia.com>
In-Reply-To: <20251218013910.459045-2-ttabi@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 18 Dec 2025 11:09:56 +0100
X-Gm-Features: AQt7F2oLOGrUtKfwwSjj0SjFhxy_KX0J4BetzT_Vf8Xgjs9LtDZc-yngX1nri3c
Message-ID: 
 <CANiq72mEsqgyHZoP0gA-Mev0M=TrgKFruJTACfaGW1DgDG5Lyg@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] rust: pci: add PCI device name method
To: Timur Tabi <ttabi@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 6SXGIN4UN2OPI2ITDTRPPSUJXLH57G7J
X-Message-ID-Hash: 6SXGIN4UN2OPI2ITDTRPPSUJXLH57G7J
X-MailFrom: miguel.ojeda.sandonis@gmail.com
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6SXGIN4UN2OPI2ITDTRPPSUJXLH57G7J/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72mEsqgyHZoP0gA-Mev0M=TrgKFruJTACfaGW1DgDG5Lyg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Dec 18, 2025 at 2:40=E2=80=AFAM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> +    /// Returns the PCI device name.
> +    ///
> +    /// This returns the device name in the format "DDDD:BB:DD.F" where:
> +    /// - DDDD is the PCI domain (4 hex digits)
> +    /// - BB is the bus number (2 hex digits)
> +    /// - DD is the device number (2 hex digits)
> +    /// - F is the function number (1 hex digit)

It probably looks better like (i.e. code spans + ending in period):

    /// This returns the device name in the format `DDDD:BB:DD.F` where:
    /// - `DDDD` is the PCI domain (4 hex digits).
    /// - `BB` is the bus number (2 hex digits).
    /// - `DD` is the device number (2 hex digits).
    /// - `F` is the function number (1 hex digit).

> +            // If init_name is set, use it; otherwise use the kobject na=
me

Similarly:

    // If `init_name` is set, use it; otherwise use the kobject name.

Thanks!

Cheers,
Miguel
