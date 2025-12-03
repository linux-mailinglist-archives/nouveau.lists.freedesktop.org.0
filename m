Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10381C9EEE3
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 13:03:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A4F10E77F;
	Wed,  3 Dec 2025 12:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ubaQHSZw";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350B110E783
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 12:03:45 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-477cf25ceccso53363755e9.0
 for <nouveau@lists.freedesktop.org>; Wed, 03 Dec 2025 04:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764763424; x=1765368224;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=PtHQog5qmipsoaUag3IIt+tHiP4IbPCLqBREJ8ta/OI=;
 b=ubaQHSZwS6f4ESFGM5PX08tZ8vWxjM9lF42DNmaIOmmckiwNUqEXalGvkyR57v+CLI
 YKbW3MRqLbIibrrWR7bWKtw5z2+xRqZXDKxKcTzABlPBIfmj291tSY6G5ThsWaF5JKMJ
 Xe08oMfVzCLM5WmeNFsEYMJVih90V8YxkOoSn1ZQKRRO036DVVhkuLMoPR7qQCjfsze9
 iAcAPpboZ3Jj9ypxpi5AsiU9jb/JLs3xHFjeuz+v2gJ1xUyxirNOr4oJww2h1uokPgGO
 5onVBmDcpT2lg7MJd/07EI9pl5sIyJKodbshDTKwQ9mONSak/+XlwJ4P/gi4EgLHrzc4
 ALuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764763424; x=1765368224;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PtHQog5qmipsoaUag3IIt+tHiP4IbPCLqBREJ8ta/OI=;
 b=rhSZU2txT0tzuVB+GbK8KqJKKSegg7aomXkawzjrgHajN4v4tBzl2LBQPFP92zrVVm
 i4Mp0IrNRm3lHWVgcoagltYLFu/VHuLdxoR5JO8SQB8/2c5WewyavpeumkOKoylVuPRp
 p5meYk5jmfYX7QE+OaklQ1xKnhL8n8m+wOqXe3iUBSINzX7Tr55QuQrlCKHDgAyZgN3T
 jjl77xuIbAilAaMkWiCCTFEkMHISjdL3eGIpS12mgQjMstIZneLe45e2ofew/4GkjDF/
 T+fM2/t+WydZkRF2gmJN4BJuWI8R1RIOVDRNPJm1LrxZHc+G0Is4ABmFRMKwE7RC2icE
 qTvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVATPwgIXm/UAv4FSLWV9H7tyAuwwQuGvg9I3kTp+AoPCT4iPoBoWm5ZB1RrCkErtff1FfY9sox@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIB+7v84UHJaDXCBHBpFenz3RxlwcmW9TDYrUnbgqvfkpiRUsN
 Dcn/9R0fHhcMhE5fmkDqJSbqoNlljaDejf0JeQPla11TcvO9Ie7Vp6vSuRbF8bcc+TZVJL+eLLy
 HSJiT5jWeCwEIRRPEzQ==
X-Google-Smtp-Source: AGHT+IExOwyk8Vry3CIzUxxYL1GwxJ1Wt7CQYNbI21qhICyr3246VNdFd4xzMP4HZq+nX7Wk4VtTlapbff4EghY=
X-Received: from wmos9.prod.google.com ([2002:a05:600c:45c9:b0:477:9b3e:67e3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e91:b0:477:7975:30ea with SMTP id
 5b1f17b1804b1-4792af4182cmr19633645e9.29.1764763423746; 
 Wed, 03 Dec 2025 04:03:43 -0800 (PST)
Date: Wed, 3 Dec 2025 12:03:42 +0000
In-Reply-To: <DEOK871CSNZB.W94R3SDUDZ22@nvidia.com>
Mime-Version: 1.0
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-11-ttabi@nvidia.com>
 <DECCV8XB5U56.1NBFD1KFJ59LU@nvidia.com>
 <b28cff274d79de78496c7f0fcc3627b2f816d3dc.camel@nvidia.com>
 <DEOK871CSNZB.W94R3SDUDZ22@nvidia.com>
Message-ID: <aTAnHrcaP23_6lDh@google.com>
Subject: Re: [PATCH 10/11] gpu: nova-core: LibosMemoryRegionInitArgument size
 must be page aligned
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, 
 "lyude@redhat.com" <lyude@redhat.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 John Hubbard <jhubbard@nvidia.com>, 
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
 "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Dec 03, 2025 at 08:54:31PM +0900, Alexandre Courbot wrote:
> On Tue Dec 2, 2025 at 8:25 AM JST, Timur Tabi wrote:
> > On Wed, 2025-11-19 at 12:36 +0900, Alexandre Courbot wrote:
> >> You can use the `Alignment` type here, as the rest of the code does:
> >>=20
> >> =C2=A0=C2=A0=C2=A0 let size =3D num::usize_as_u64(obj.size())
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .align_up(Alignment::new::<=
GSP_PAGE_SIZE>())?;
> >>=20
> >> Now `align_up` returns an error in case of overflow, that we will need
> >> to pass down to the caller by changing the return type of `new`. It is=
 a
> >> bit annoying, but better than the behavior of `next_mutiple_of` in suc=
h
> >> a case, which is to panic. :)
> >
> > I see your point, but these are u64s that we're talking about.  The onl=
y way next_mutiple_of() can
> > panic is if obj.size() is greater than 0xFFFFFFFFFFFFF000, which is not=
 possible. =20
> >
> > I would say in this case, a panic is preferable to a convoluted error r=
eturn that will never be
> > exercised, because failure here indicates a coding error, not an input =
error.
>=20
> The input data is a usize, so technically we could get an input that
> triggers that error.
>=20
> I know it's a very edge case, and clearly indicates a bug, but the
> general rule is: don't panic the kernel. And in Rust, if possible, don't
> even let me compiler insert panic-handling code. If you don't want to
> change the return type of the method, then maybe use `unwrap_or` and
> `inspect_err` to print an error before returning e.g. `0`.
>=20
> But others have already thought "naah, that's never gonna happen" and
> got burnt very publicly [1], so let's learn from that. :P
>=20
> [1] https://blog.cloudflare.com/18-november-2025-outage/

For what it's worth, my friend at Cloudflare tells me they would have
failed in the same way had they used ? instead of unwrap.

Alice
