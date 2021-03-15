Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA8633AE7A
	for <lists+nouveau@lfdr.de>; Mon, 15 Mar 2021 10:19:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB7F89D46;
	Mon, 15 Mar 2021 09:19:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13D589D46
 for <nouveau@lists.freedesktop.org>; Mon, 15 Mar 2021 09:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615799941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YaKF46cR8UVINzdyp0SZQNejMQtbBmyCW8nAoT8bdZI=;
 b=VctThTm5Wrb8gvJFYlu/810jalnIOR650t9uy1iGF9FrYwKnkUE9dtAC2vd3eGycbp3zB3
 CI+w+d4FBQJLCLlln3mG861i4VYFRKlzZ9DlTfJJX2e/Nxwrp8nqFsIo6AZazQOdasOG8E
 Jgo9F+aVAN0bHdPEMb5GfficwJv2p90=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-ShhvYm8LPCOXqqeqyzSHPQ-1; Mon, 15 Mar 2021 05:18:56 -0400
X-MC-Unique: ShhvYm8LPCOXqqeqyzSHPQ-1
Received: by mail-wm1-f70.google.com with SMTP id n2so7920170wmi.2
 for <nouveau@lists.freedesktop.org>; Mon, 15 Mar 2021 02:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YaKF46cR8UVINzdyp0SZQNejMQtbBmyCW8nAoT8bdZI=;
 b=EIt9aNuhtR0MjDoH4C/MlWlF3CGgvgAZ3z/5Srn4BcNnQQQ8kXvCYyjbhfm4MQFgwB
 XCMHXbdlazzv9rPhR25JqAksOP4AtNawgGlVMlJP8eHVFyZLK+qdqMNkC3PaxK/CEeWo
 xJl3qpdS+it4aV6Xi7n3L/lzWqAd1TmFrLap2ScmYJqMei/Up2CbBvVoEW3En5W7aYfA
 q/I45qaqAKhX00dCgvu/lSJvlSMAgr+jQmB+UE+g0EEiaCjvR5JB/dp84jt8UxslqC/I
 tTiqiOSnxPn7hGeew4BIJUDpa7zjMq/buUaX7HuOyXm5bsLeUPzt7qBfuLirvuMGIkNM
 u/EQ==
X-Gm-Message-State: AOAM532VceV+pWyq2soyzX5PkemqEPwwhYIx3dbrOGxW+92Jtaa2IW1f
 JWRc7ovjX+hAS1pYoG0HP93ceu6nCA/7PG2Ch0UaJ+5wwyT5JKkenmjOUF8hxtC98IbGr82w1UZ
 uUbXr4/ea8D5R2dcL0X0oJjA3NDOCfBcoS8xW6LcEUA==
X-Received: by 2002:adf:d217:: with SMTP id j23mr27189283wrh.113.1615799935252; 
 Mon, 15 Mar 2021 02:18:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzux1oBASGYyLPiMDkKyQnMmlhVv15+gudyVfT+HJIbYt1rOEBtMIJj8gBdsCLWPT1xedHB+lz3z1TsK2wVNs=
X-Received: by 2002:adf:d217:: with SMTP id j23mr27189266wrh.113.1615799935047; 
 Mon, 15 Mar 2021 02:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <MVl5Vra--3-2@tuta.io>
In-Reply-To: <MVl5Vra--3-2@tuta.io>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 15 Mar 2021 10:18:44 +0100
Message-ID: <CACO55tuQFKOxXBb8kKhz=oTWYxZLfHTccnBDzz_wE2UD9MLOuQ@mail.gmail.com>
To: stratus@tuta.io
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] That dispnv50 patch blew up my laptop AGAIN as now
 it's in the LTS kernel
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
Cc: Nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sun, Mar 14, 2021 at 11:04 PM <stratus@tuta.io> wrote:
>
> https://forum.artixlinux.org/index.php/topic,2083.msg14006.html#msg14006
> https://forum.artixlinux.org/index.php/topic,2383.new.html#new
>
> It is going to blow up many more now, the freeze bug may take days, weeks or months to appear, now with this patch on some hardware it will do nothing on others it will destroy the motherboard like I reported before.

stop writing nonsense. I am sorry you are unlucky with your
motherboards, but those patches definitely did not cause your
motherboard to blow up.

> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
