Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E418804678
	for <lists+nouveau@lfdr.de>; Tue,  5 Dec 2023 04:28:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFCA10E055;
	Tue,  5 Dec 2023 03:28:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E88510E47D
 for <nouveau@lists.freedesktop.org>; Tue,  5 Dec 2023 03:28:02 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a1915034144so617365766b.0
 for <nouveau@lists.freedesktop.org>; Mon, 04 Dec 2023 19:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701746880; x=1702351680; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hYatJNdEoSUXrxv/HdZGUQ/ojWiDTxCBNJRcQRf5stQ=;
 b=REKVRLZGfGbjeuVVZ1/pTBxf1uGgHlCqefxD/NQva313v0fiJilllmy9T2+YLKg2ht
 s/OYX5B024e3KhW86Crjw5TVhSiJvHiBng3IWibRqgwm3ag0nTvnt8rcHmg/vl8NROmB
 pc2PKdU02lm7071l8M/591vjYtCZobPYgCwM3TTKsF57ls6r1gjO5Rn0zhcB8eo9h9m1
 rrK6UwL1oK9NHAeg+mw1vTWVxdY8v8Efr+ioK8VJSkzrClwiea1Ykvrn/vIenoVFzX7l
 QI94enCkQAHz25MTIGQAmOahAfMgn4GYKZlM++ZFA0OxQAqbR3806PK0Ix86YW5vqVi2
 nW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701746880; x=1702351680;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hYatJNdEoSUXrxv/HdZGUQ/ojWiDTxCBNJRcQRf5stQ=;
 b=k5mwitqOhqiVJ/6KlnNXoQ+mrdHpwg7j6xY6BeIYqyUbSDd0jhOjdS8nVmTEHMbarz
 Cx7boHbka/9hsMdEYPVq+Rsyntpo78bI98enpDDoIXKTGWzUXTTxJgF1c2osNVZJ6pZ/
 p+SqLdb73dSiDmyj2+OVMl3Hy2BqmfK+knfIeyCdL1lTpb8KJBATSHLFIpJUpUXqv+BM
 N2HmUYNJgYO3hl0Qa/yrI7AlNw8IdkVbwdADnOsVAwRDBEkdwYQaIk+bMbsbwpgYys82
 DTdzjxE8nZzgRhXIPdOtu6aaoQzo/I7rHz2XwBEEuxKf9zjQgWMHlI3/825o93Psoqjt
 AMWg==
X-Gm-Message-State: AOJu0YzAYEMO80kR867v7J/QXsHN3U22JB+oL9/nVrfQ/6xqEbJ3Tkkn
 rzarkBCUJ6vo96v9+JZxMONIO8xRxciDlyLy9FCtXJgu
X-Google-Smtp-Source: AGHT+IGJwqji33XgR0GvMaKZMiaHv+p8vUIKyNU0XbU4Cxpp1406WDF7O9xYSq1n5v/scZsGt5MobzX/h5P1/xE06Hg=
X-Received: by 2002:a17:906:a885:b0:a19:a19b:c72b with SMTP id
 ha5-20020a170906a88500b00a19a19bc72bmr3664622ejb.123.1701746880252; Mon, 04
 Dec 2023 19:28:00 -0800 (PST)
MIME-Version: 1.0
References: <18c311115a3.b63b522e4445.755018207880528406@zoho.com>
In-Reply-To: <18c311115a3.b63b522e4445.755018207880528406@zoho.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 5 Dec 2023 13:27:49 +1000
Message-ID: <CAPM=9tz6xA=iY617nCTpjW9haJzV=nhgbQfVVzkdG8GYphM+Ww@mail.gmail.com>
To: Paul Dufresne <dufresnep@zoho.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] Meaning of the engines in paramaters of nouveau module
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, 4 Dec 2023 at 05:04, Paul Dufresne <dufresnep@zoho.com> wrote:
>
> In https://nouveau.freedesktop.org/KernelModuleParameters.html, there is:
> Here is a list of engines:
>     DEVICE
>     DMAOBJ
>     PBSP
>     PCE0
>     PCE1
>     PCE2
>     PCRYPT
>     PDISP
>     PFIFO
>     PGRAPH
>     PMPEG
>     PPM
>     PPPP
>     PVP
>     SW
> Also, in debug:
>    CLIENT
>
> I have tried to find a description of those.
> https://envytools.readthedocs.io/en/latest/
> help a bit, but I don't find a precise correlation.
>
> https://nouveau.freedesktop.org/NouveauTerms.html
> does not seems to have most of these terms.
>
> I am particularly curious about PCE[0-3].
> But also about CLIENT, that seems different and mysterious.
>
> I wonder if it is possible to write:
> nouveau.debug=info,PDISP=debug
> to have the info debug level as the default, but for PDISP have the debug level
>
> Also, my interest is linked to the state of GPU graph given after a context switch timeout that looks like:
> [ 1696.780305] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
> [ 1696.780361] nouveau 0000:01:00.0: fifo:000000:00[      gr]: 8006e005: busy 1 faulted 0 chsw 1 save 1 load 1 chid 5*-> chid 6
> [ 1696.780422] nouveau 0000:01:00.0: fifo:000000:07[     ce2]: 00050005: busy 0 faulted 0 chsw 0 save 0 load 0 chid 5 -> chid 5
> [ 1696.780476] nouveau 0000:01:00.0: fifo:000004:04[     ce0]: 00000000: busy 0 faulted 0 chsw 0 save 0 load 0 chid 0 -> chid 0
> [ 1696.780529] nouveau 0000:01:00.0: fifo:000001:01[  mspdec]: 00000000: busy 0 faulted 0 chsw 0 save 0 load 0 chid 0 -> chid 0
> [ 1696.780581] nouveau 0000:01:00.0: fifo:000002:02[   msppp]: 00000000: busy 0 faulted 0 chsw 0 save 0 load 0 chid 0 -> chid 0
> [ 1696.780633] nouveau 0000:01:00.0: fifo:000003:03[   msvld]: 00000000: busy 0 faulted 0 chsw 0 save 0 load 0 chid 0 -> chid 0
> [ 1696.780689] nouveau 0000:01:00.0: fifo:000000:00[      gr]: 8006e005: busy 1 faulted 0 chsw 1 save 1 load 1 chid 5*-> chid 6
> [ 1696.780744] nouveau 0000:01:00.0: fifo:000000:00[      gr]: 8006e005: busy 1 faulted 0 chsw 1 save 1 load 1 chid 5*-> chid 6
> [ 1696.780795] nouveau 0000:01:00.0: fifo:000000:00[      gr]: triggering mmu fault on 0x00
> [ 1696.780835] nouveau 0000:01:00.0: fifo:000000:07[     ce2]: 00050005: busy 0 faulted 0 chsw 0 save 0 load 0 chid 5 -> chid 5
> [ 1696.780942] nouveau 0000:01:00.0: fifo:000000:00[      gr]: 00000100: mmu fault triggered
> [ 1696.780987] nouveau 0000:01:00.0: fifo:000000:00[      gr]: c006e005: busy 1 faulted 1 chsw 1 save 1 load 1 chid 5*-> chid 6
> [ 1696.781040] nouveau 0000:01:00.0: fifo:000000:0005:[Renderer[13701]] rc scheduled
>
> where I suspect ce2, is linked to PCE2.
>
> Is there a documentation that describes those "engines"?

CE is copy engine.
But this looks like an mmu fault on the GPU side, so some shader is
doing something wrong most likely.

Dave.
