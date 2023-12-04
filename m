Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 596CE8039B9
	for <lists+nouveau@lfdr.de>; Mon,  4 Dec 2023 17:09:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9271B10E223;
	Mon,  4 Dec 2023 16:09:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31E910E223
 for <nouveau@lists.freedesktop.org>; Mon,  4 Dec 2023 16:09:14 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 006d021491bc7-58ce8513da1so3167419eaf.2
 for <nouveau@lists.freedesktop.org>; Mon, 04 Dec 2023 08:09:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701706154; x=1702310954;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SurVp0u5zZPGRRRcN7xyf23fAwZSCzznjbC7+kXTXzk=;
 b=qGnwWyH11Eipnc4jxmY8WJjpyTkjoJSxPWtCpJOreOuN0+y+fsItBh2zgw/P9bZEPt
 iI+4/FlZ4crnrQ36b6yEBFTu6gsRjUGzWAnK5UXu/BWjOsggwrG/BqudZkLwVK4v1NSu
 oE/Bv1VW5RxkGwMPRhJbv18FCH4SjmlWUzSIfDlh0xS2jrz69CeMLvzO6MW3oRIHvYAv
 0/JT1AwgH9RmpB7eOsjvfTbhqsOlEto5/zeb0cAXmlTWnH3ldoAj6MbwhwVP08OssmHu
 pekPZ0Vyx0xq/GHQv97nuNqJvFzClZwuQ1YiAfbK487xUoVuLTUwOzLqslQ9LQb252uS
 ea4A==
X-Gm-Message-State: AOJu0Yx4LDzuqr6uFkY0IfVlL/Ydg22C0OB1epmXY72N9c5xJpq1WV22
 d9+ekE4Jo+c6QYMMySgiQyWFlMu8hXUQ/Mdur2g=
X-Google-Smtp-Source: AGHT+IHmUXzZYw15zTkHdHXUxxPzh+mX33LZcvvIWCk82Ji0OON2qY2m3CNZ/pitXDHixgjAL25wyhuWjFgYE/+Pmq8=
X-Received: by 2002:a05:6870:304a:b0:1fa:1719:dce2 with SMTP id
 u10-20020a056870304a00b001fa1719dce2mr5074393oau.28.1701706154057; Mon, 04
 Dec 2023 08:09:14 -0800 (PST)
MIME-Version: 1.0
References: <CACrD=+_79g1_-EbiOk5YCbHV+x_ZFz+qDDcoXGdRGx-SVirZrg@mail.gmail.com>
 <CAKb7UvijhyMJ7e5Pp=mYA2YTXhCC02Q8Ne3RmDEQC5uF6pmvyg@mail.gmail.com>
In-Reply-To: <CAKb7UvijhyMJ7e5Pp=mYA2YTXhCC02Q8Ne3RmDEQC5uF6pmvyg@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 4 Dec 2023 11:09:03 -0500
Message-ID: <CAKb7UvhJfmh9=WrcjP0ZL3Ogbd7L7iHo0ZJe2GzXEd2MXzNx_Q@mail.gmail.com>
To: Monty Montgomery <xiphmont@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] PR: nv50 IB-mode DMA crash fixes
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
Cc: nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Dec 4, 2023 at 11:04=E2=80=AFAM Ilia Mirkin <imirkin@alum.mit.edu> =
wrote:
>
> On Sun, Dec 3, 2023 at 11:37=E2=80=AFAM Monty Montgomery <xiphmont@gmail.=
com> wrote:
> > 1) The nv50 DMA code clearly believed push buffers could not (or
> > should not) exceed NV50_DMA_PUSH_MAX_LENGTH, when my analysis logging
> > shows that they regularly exceed this maximum by an order of magnitude
> > or more.  Was the assumption originally true?  If so, when/why did it
> > change?  Is the more correct fix to enforce individual pushbuf size
> > limits?
>
> The BO itself can be artibrarily sized. However the length stored in
> the ring only has so many bits, so that provides a natural maximum.
>
> https://envytools.readthedocs.io/en/latest/hw/fifo/dma-pusher.html#ib-mod=
e
>
> This might be different on newer gens though.

Oh, but that said, the way we pass the NO_PREFETCH flag through *is*
by bumping the length -- IIRC the uapi doesn't have an explicit
setting for it.

e.g. see https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/no=
uveau/nvc0/nvc0_query_hw.c#n477

This is the API for libdrm_nouveau, but I seem to recall it's largely
just passed through.

Cheers,

  -ilia
