Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9331F42C7AB
	for <lists+nouveau@lfdr.de>; Wed, 13 Oct 2021 19:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF316E0E8;
	Wed, 13 Oct 2021 17:31:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037096E0E8
 for <nouveau@lists.freedesktop.org>; Wed, 13 Oct 2021 17:31:13 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id d131so8280134ybd.5
 for <nouveau@lists.freedesktop.org>; Wed, 13 Oct 2021 10:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=ri0jnJLbtQY8pzBVMtxcF6F4FOstCEkPkix8vFaAEuU=;
 b=ZKmHHAys7vyzb7hiMmovFeBSbqhh0iSmjZLht7Yvk+x5lxoVyAjpORN7aWGhcxtKG4
 RfyjnbukqdmXgWws0/yMzYrnmsvXetYfsXHBNSrhFCfw5y4G8yUrIUnNsoxUxJfd5eGu
 mtluQ9QrOXOn9Mz5mKa6EoeC6NIzPb9eTFVlCP1kRziyRWBfG2zCUDNeU8992XraHmGO
 ps5Cixz4vNPQnOampb1SiwlcSv+EYKtoNZy15WhCmdoL0EvkJnW/KLLLUantWsEohJdy
 bnAYJtuOZh5NrzNJcb5/M86z/pGPy5MhNaOHjX0Hqqya1LyGaWUtP4ErxoXcrCuLPvsK
 w1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ri0jnJLbtQY8pzBVMtxcF6F4FOstCEkPkix8vFaAEuU=;
 b=0g5wZQPJgj7syJLAwP22RUA4LPYYmpnCpzTwihYBuswplKnbqjex5B2k3iNpktP935
 yt3HIJQ21ULPzC9OvXEiZ2dRtzJs7idVyyF8q7bO9H3Dhs0LNQTiHi2Bw+mxdUqqbe7h
 23McUB+JRsTWs/9otRK/gza7joD4pXDKrFjeJkkKxlJUHGp1/JzN844Qr64FIGdrEjfi
 Cv0kECF/wAWdFkZd1ROUG2P8gqGmI0uqj/faf0CyYEBlJGOyqEGxJlE/KH2ehj02XM6F
 fYSel2A7YPQvgZpEGMxqByHKmQEOYvSC20HsCPECIl2ZvYL0X4zuSL9swUW1RfQCZ4cA
 nmyQ==
X-Gm-Message-State: AOAM530+I931/UdeqZX8kEJQyaC3J4muclzW8rfnTm1Xsty/OXk8Hi2s
 o9s7a9uXwLKt6mBdqD+2SF9pPW7EtiQvW7ApoZ100qmonVY=
X-Google-Smtp-Source: ABdhPJyS/jIxdlPCaQ54JU9IEBKtbrzj1vQkdWBtkDcfa+dHxGZWpnyhwsuKUo3PUP4RZjeWjXz+IfDLJik/DrRjFKQ=
X-Received: by 2002:a25:aa8e:: with SMTP id t14mr728718ybi.532.1634146273012; 
 Wed, 13 Oct 2021 10:31:13 -0700 (PDT)
MIME-Version: 1.0
From: Computer Enthusiastic <computer.enthusiastic@gmail.com>
Date: Wed, 13 Oct 2021 19:31:01 +0200
Message-ID: <CAHSpYy3G7EPhLBAiy4MgngKRqFgs1cTC-pnJb662vxxmkmxPXA@mail.gmail.com>
To: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Subject: [Nouveau] Advice about debugging nouveau driver suspend issue
 (init_on_alloc=1 and init_on_free=1)
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

Hello,

Greeting to all list members.

I hope this mailing list is the right place to ask about it, otherwise
I apologize in advance and, please, direct me to the right mailing
list.

I would like to receive advice on how to debug (or help to debug) the
noveau kernel module suspend issue reported in [1][2][3]. The issue is
constantly reproducible and it consists in a  screen corruption with
system lockup on resume after suspend to ram or suspend to disk. It
seems to affect NV50 nvidia graphic cards at least from kernel 5.10.0
(probably from 5.2 or 5.3) up to 5.14.10 (I have not tested 5.15 in rc
state, actually).

Thanks in advance.

[1] https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/-/issues/547
[2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=989705
[3] https://bugzilla.kernel.org/show_bug.cgi?id=213617
