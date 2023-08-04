Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A4C770088
	for <lists+nouveau@lfdr.de>; Fri,  4 Aug 2023 14:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEBD10E6E7;
	Fri,  4 Aug 2023 12:52:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E2710E608
 for <nouveau@lists.freedesktop.org>; Fri,  4 Aug 2023 12:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691153517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dRlXGWY/CFWI5iW4ld/1S29gsGd4s6U2sDlhS/FmuSE=;
 b=inyIqqQtYt9/hxpljKhZne0FpgImGeemVbUqOBFFlRvYDRrJWVURZG6lajHHNow75LGdgk
 KJ5e9Q8PDCBT/UiMngv2D2+wAfRwjqO6OYcuGC+NmQxgv/u2F3ofJGqap4CRORssrjDYcK
 T3djS65XdEsa04gnfwp9svq4fbYMYtA=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-2WmXxQnvMUCj0qJFcI_3Vw-1; Fri, 04 Aug 2023 08:51:55 -0400
X-MC-Unique: 2WmXxQnvMUCj0qJFcI_3Vw-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b04d5ed394so3184501fa.1
 for <nouveau@lists.freedesktop.org>; Fri, 04 Aug 2023 05:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691153514; x=1691758314;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dRlXGWY/CFWI5iW4ld/1S29gsGd4s6U2sDlhS/FmuSE=;
 b=VB4dPX2tAcBg1HZ65h63mdUnFJKR4GLPr+zB7CE8+1XgW5s6Sqdq4rBInZzMpZ0CwK
 YzTieFY+N84263QIczw3u5+CWP/sni4obW+V7TV0VAhiJlZc+myPVmtgAeKwfIbw3a3R
 GmbUMiXbgM5H+fDtm66LC1+lzByWn3kDuiwlYGF+fPcP6uTPsSPnT6mfUAwohKWRLVmi
 Nl0k6L3ssgVauc4wF1DTen2F3BbXuMe/7KLlU92deVVzaO2EaMqf+JLYlcE1dzPyHMf7
 lBdH0tIB1ag4r9p3zIIwQDZLU8/NGCbMf85VSGTqlGWB1iMHW8uD4r0YKMTPR49Es/TS
 4OlA==
X-Gm-Message-State: ABy/qLYZU2By9EB5+NlMwziWLufsuA76LQNIEUQhs1tKjKTwgbr33KDp
 istuZd7UsBQQ4SeOxLJnzOAEl1T/8WV0MDfHx2RdwijZn1LViutSdPe8+ID/Bc8FbO3uE2nAQTJ
 ZbIsTC2Bv6b7aHlDsCpKf0MNnJXdEcGkGR4U/FZUpWg==
X-Received: by 2002:a2e:a7cf:0:b0:2b6:9969:d0ab with SMTP id
 x15-20020a2ea7cf000000b002b69969d0abmr14626217ljp.4.1691153514605; 
 Fri, 04 Aug 2023 05:51:54 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFrcSjZXh6YM3wQYlauuWGfFGZv19JjISaVV8WqI5Be/z9XCLqb6j13RdZZx7ibxrrJTgr6pbJPMHFHOKn9vpw=
X-Received: by 2002:a2e:a7cf:0:b0:2b6:9969:d0ab with SMTP id
 x15-20020a2ea7cf000000b002b69969d0abmr14626204ljp.4.1691153514326; Fri, 04
 Aug 2023 05:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <20be6650-5db3-b72a-a7a8-5e817113cff5@kravcenko.com>
 <c27fb4dd-b2dc-22de-4425-6c7db5f543ba@leemhuis.info>
 <CACO55ttcUEUjdVgx4y7pv26VAGeHS5q1wVKWrMw5=o9QLaJLZw@mail.gmail.com>
 <0a5084b7-732b-6658-653e-7ece4c0768c9@kravcenko.com>
In-Reply-To: <0a5084b7-732b-6658-653e-7ece4c0768c9@kravcenko.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 4 Aug 2023 14:51:43 +0200
Message-ID: <CACO55tvu4X3u8K-FGUeN2CBw1BnumRPBNEEqjn+EPzNCCCQYyg@mail.gmail.com>
To: Olaf Skibbe <news@kravcenko.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] nouveau bug in linux/6.1.38-2
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
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 nouveau@lists.freedesktop.org, 1042753@bugs.debian.org,
 dri-devel@lists.freedesktop.org, Thorsten Leemhuis <regressions@leemhuis.info>,
 Ben Skeggs <bskeggs@redhat.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Aug 4, 2023 at 2:48=E2=80=AFPM Olaf Skibbe <news@kravcenko.com> wro=
te:
>
> On Fri, 4 Aug 2023 at 14:15, Karol Herbst wrote:
>
> > mind retrying with only fb725beca62d and 62aecf23f3d1 reverted?
>
> I will do this later this day (takes some time, it is a slow machine).
>
> > Would be weird if the other two commits are causing it. If that's the
> > case, it's a bit worrying that reverting either of the those causes
> > issues, but maybe there is a good reason for it. Anyway, mind figuring
> > out which of the two you need reverted to fix your issue? Thanks!
>
> I can do this. But if I build two kernels anyway, isn't it faster to
> build each with only one of the patches applied? Or do you expect the
> patches to interact (so that the bug would only be present when both are
> applied)?
>

How are you building the kernel? Because normally from git reverting
one of those shouldn't take long, because it doesn't recompile the
entire kernel. But yeah, you can potentially just revert one of one
for now and it should be fine.

> Cheers,
> Olaf
>

