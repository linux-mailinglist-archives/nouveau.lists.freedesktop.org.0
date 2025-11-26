Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F33C891E4
	for <lists+nouveau@lfdr.de>; Wed, 26 Nov 2025 10:53:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BEC10E594;
	Wed, 26 Nov 2025 09:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="E8sEroEi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5166710E594
 for <nouveau@lists.freedesktop.org>; Wed, 26 Nov 2025 09:53:08 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-477563a0c75so34728475e9.1
 for <nouveau@lists.freedesktop.org>; Wed, 26 Nov 2025 01:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764150787; x=1764755587;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=jhEHhAF1sFWBdc1QzDdCrjT0zY8oot45leW9hxEVcLk=;
 b=E8sEroEicaVxtWiqrT4kH+kUWI049c0LBD9h22yhLUUdwby8CVFgx9FjqqqP0/BwTC
 4XcUAGYYlAVizYQbAg1rtSDZEAH1ne9mxwpQfEN3bmhtWfIR04gVJIwj4ppViBCG2HUv
 nY6eDTx5BsqMM1J85bozI5vX1zfTUAD085nLSqcSyYRQirZ3ZutZ8YC2P51VAmZUfCRa
 6vmK2jmDD2PF0SQ9aWhVG5cBZ5zxLVtatAvhLmgVypjGZ5ACpEgT5hK4DXspcQu3rKgS
 jDhMl/Tcdxn/10DwewC8qY3F5Aw+HP2pgnsV2sjwpLMv1fbenaa59dmYWTAkgG66hh5l
 9jZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764150787; x=1764755587;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jhEHhAF1sFWBdc1QzDdCrjT0zY8oot45leW9hxEVcLk=;
 b=KlzIJL6GrUfhj/F//x3TlY/NR8MvGj0jol9kdWojkrCI3CEwkhL0nTRbuCv6q55xYu
 GzSHT5ipJKI65uvfHkOX1B8+Y42Zhw3/sXeF98M2D85jc5092tTigQ7Qt3Yf7pUsMCDw
 ssIsklge9Z3tKsixbZwgh+QJO4AgkSG9J++PhpK5rKbVfCwBgO4Jl2VpLhaQsthvwnXj
 cGkNyHKAOnNwWzoVjIyMVXzaAn4CdzNFziJb6vsnfcaj6HDXFHNOnB9s2wjV9DDs6LDy
 ncGQscICkTYgHgQwPdKciLSl5LOc25ExI1ljwJTwdedcobDXg6fIaOm51DqckMP/m6/l
 aTzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZyLjL0jT0LHxgz4tNDdjLex3Oj2ptw4YAaJv5N9jTFg3p3yBnu/3Bx7T86/2gR9X8ZJscmAwE@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwhwQxRe0xSyx58KycdB2ybOvYzmjlsJS7eP45k6BJIlJwzE8/
 xwB8fua+v52M77D2F51XkmwHG8wklbSnm9xlk5QjQJ+huFDtZq8d1puQX6k3jbUIlIH3sWL00Ac
 8WHjdxTe6i3Jm00N60w==
X-Google-Smtp-Source: AGHT+IE+qKOTlNOP6qk4XcA7FZuJhhCVo9nCRh/d2GGRWB4YahgXOtDPJUzXQ11aXHlXjufKyykmptnJ4oEGLdo=
X-Received: from wmkz11.prod.google.com ([2002:a7b:c7cb:0:b0:477:9654:b44c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b9c:b0:477:af07:dd22 with SMTP id
 5b1f17b1804b1-47904b24243mr56076495e9.28.1764150786911; 
 Wed, 26 Nov 2025 01:53:06 -0800 (PST)
Date: Wed, 26 Nov 2025 09:53:06 +0000
In-Reply-To: <aSaU5lSmtD17U0kT@fedora>
Mime-Version: 1.0
References: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
 <aSV1rxXq4KuInexy@google.com> <aSaU5lSmtD17U0kT@fedora>
Message-ID: <aSbOAsOJbhtkJACJ@google.com>
Subject: Re: [PATCH 1/1] drm: nova: Align GEM memory allocation to system page
 size
From: Alice Ryhl <aliceryhl@google.com>
To: Brendan Shephard <bshephar@bne-home.net>
Cc: dakr@kernel.org, acourbot@nvidia.com, joelagnelf@nvidia.com, 
 jhubbard@nvidia.com, airlied@gmail.com, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, brendan.shephard@gmail.com
Content-Type: text/plain; charset="utf-8"
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

On Wed, Nov 26, 2025 at 03:49:26PM +1000, Brendan Shephard wrote:
> On Tue, Nov 25, 2025 at 09:23:59AM +0000, Alice Ryhl wrote:
> > On Fri, Nov 21, 2025 at 02:04:28PM +1000, bshephar@bne-home.net wrote:
> > >  impl NovaObject {
> > >      /// Create a new DRM GEM object.
> > >      pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<gem::Object<Self>>> {
> > > -        let aligned_size = size.next_multiple_of(1 << 12);
> > > -
> > > -        if size == 0 || size > aligned_size {
> > > +        // Check for 0 size or potential usize overflow before calling page_align
> > > +        if size == 0 || size > usize::MAX - PAGE_SIZE + 1 {
> > 
> > Maybe this should use isize::MAX as the maximum size instead? That's a
> > pretty common maximum size for allocations in Rust and big enough for
> > everyone.
> > 
> > Alice
> 
> Thanks for the review Alice. I used usize here because the page_align()
> function specifically mentions that the provided value should not
> overflow a ['usize'].
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/rust/kernel/page.rs#n30
> 
> I don't think that alone needs to be the deciding factor, but it's worth
> expressing why I made that decision to begin with. Happy to hear your
> thoughts, and if you still feel isize::MAX is more appropriate given
> this information.

I know that you picked this particular limit to avoid integer overflow.

I think picking a lower limit makes sense because isize::MAX is a
relatively standard choice for maximum allocation sizes. I think it is a
nice choice because it means you can always compute 2*x for any index or
size x without risk of overflow.

But it's up to the nova folks, not me.

Alice
