Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EF2CBAFDC
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F6710ECDA;
	Sat, 13 Dec 2025 12:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7+8tlVO";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03ACB10E23B
 for <nouveau@lists.freedesktop.org>; Sun,  9 Nov 2025 09:48:10 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-34159ccb610so270677a91.2
 for <nouveau@lists.freedesktop.org>; Sun, 09 Nov 2025 01:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762681690; x=1763286490; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7UbbWu4YJEt2N5oFO0yvfHfoZZvWupJp9/gMRHzUkU4=;
 b=L7+8tlVORg4tPyMs/KM6tDNzyDhkPs3yWAHTPUScW9zQDmcvCcLYM5BHOEXa6/QBT5
 a65byNXGB4+GgSTyYMphrdHNajJpEci+japtR/cLKqwd9+cIBjOXSSU/FRxcvXLDTtGB
 N0Jz3M93zrbDmgQhcz+sz2p8kw7PFElww0xcc/MfdVDcE6wiCchuaCLn4Ihok3EN14fR
 zNt7i3z0iZaursglUIyVfbwCd0ZntypBZ6/rfilpBNLDY8Pd7K2lWtBtzCTQT7kR/26c
 gCL8JvtpRLD37dKD1pgc6lxsvOjiAOunkrwlW/IVg6C1AD5+YWJjy5pO66+/7UP2FXg+
 yrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762681690; x=1763286490;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7UbbWu4YJEt2N5oFO0yvfHfoZZvWupJp9/gMRHzUkU4=;
 b=T0ar5hu013dUXZPkYMW95B9vOWM3EjfGTPHLo/jzTebLBL79AIzf2QZ67ii11D8bzx
 ctS0I4Y7/seIPgTzAw521pcTJJ8jvi7XEpVQaqeQU4eQPPoigJVCWYhrocOo3ckI/95g
 oQqZsdMy2eUT5QFDtk6Du4HTKv6v2/4HB0ebbPCgvKkRqMEoBKejjIvYws921mGfScWk
 8QjF2YQOVqrRjGTJhDRjTeCmy9D60nZVN7M4DEb0wRMlFdGIm+cixRRg+DcfBtJ0XBFP
 0DCO8JhMebrMw61xOzQK9t0eyKFVbrsUox8gGAZlWn7jaYwt/+4Nq337sXKjjSXx3l4W
 KIjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQXF0DfpHmccxs4wASiG12iPIL52XAp8G7Nu7MN+rr4N3s/+kKng9oeghmbIaox8V9gTZMuvDM@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXf5a/Qaq4hD2ANotj1BtS0iQ3bkixJg3VhaK+3xyBemIsYARv
 3mtMAStHMedEy1pqsXeFYmTr/C0T/x9/EKYN5P/10oK53gimTafJsPQEhN6lMkLacwrV+CNCRsv
 Z8t0IHIqP+8z3a1AlXz0++cnUXaUTW64=
X-Gm-Gg: ASbGnctD3vEe85+VAo0KIVFciX/r8TcleZ0iYrH9UuxrFnKBAHqC9XmtafI/SxJGUJ6
 TI1bgh0cwEQJiu5FXwOAqJaoIRQ5gCwn1zeZNnlzse/91xrUIeLETX1c3gtV4QU76pLB6y85AyI
 SpZimhMBSzmQRcAbd21jgZvwV6aER98zdswXtnBws1N77m1aJ8vwt8durXzpOfcSPUrwfz89Rsl
 EJbmD3KmCb+FSD7b0QUFRyl0wNo6l55y4IyDWjM/eWSZIeU9NhLiUfyVb6EfmIIaHe2hj50Dk4G
 AFQuiEaVtTXeEKim/DCAfW1470JJsHYQpcPEfQhClThPi1mr/Zc5FGSHC+w6MG2hVB3x+jOk8I/
 cq1g=
X-Google-Smtp-Source: AGHT+IHJ3X970Fz+WZG6aqfSKGTdXxfzPaNAG0irWW2OKqnIbo7IoDwLMSbVP8viSAFnVGTRp05nHQrCuUons0eLXmA=
X-Received: by 2002:a17:902:ea09:b0:295:511d:534 with SMTP id
 d9443c01a7336-297e5731561mr32609445ad.10.1762681690341; Sun, 09 Nov 2025
 01:48:10 -0800 (PST)
MIME-Version: 1.0
References: <20251108043945.571266-1-jhubbard@nvidia.com>
 <20251108043945.571266-2-jhubbard@nvidia.com>
 <673640f6b26617bc5e1f4962bc2f9f7257346efb.camel@nvidia.com>
 <46c4877e-2af3-440b-b8c5-fa9078a5cf9c@nvidia.com>
 <DE3AAYKKI0HN.2QTWD76BN3LMO@nvidia.com>
In-Reply-To: <DE3AAYKKI0HN.2QTWD76BN3LMO@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 9 Nov 2025 10:47:58 +0100
X-Gm-Features: AWmQ_blUxjf3ArTwjKKrEFU9NX1RDrwQAlazu89gcX-vqWpEmM0esqgYqA4hVRU
Message-ID: <CANiq72k3gkVnkW4_A47FzAD8CwYLHj3qDUhNsT27P71=XppRdA@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] gpu: nova-core: implement Display for Spec
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 "dakr@kernel.org" <dakr@kernel.org>, "lossin@kernel.org" <lossin@kernel.org>, 
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, 
 "aliceryhl@google.com" <aliceryhl@google.com>, Zhi Wang <zhiw@nvidia.com>, 
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu" <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Edwin Peer <epeer@nvidia.com>, 
 "airlied@gmail.com" <airlied@gmail.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, 
 Alistair Popple <apopple@nvidia.com>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:48 +0000
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat, Nov 8, 2025 at 12:42=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> I think this is the correct way to do; `Spec` should be the one to
> decide how it is displayed, and from a maintainability perspective this
> ensures that other sites that will want to print a `Spec` in the future
> will reuse this implementation, instead of either rewriting one
> themselves or having to figure out that there was already an existing
> site and factor it out.
>
> Iow, this code is proactively doing the right thing.

Yes, please, avoid hardcoding inlined display code.

Cheers,
Miguel
