Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C01341F058
	for <lists+nouveau@lfdr.de>; Fri,  1 Oct 2021 17:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1394E6EDE9;
	Fri,  1 Oct 2021 15:05:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028A86EDE9
 for <nouveau@lists.freedesktop.org>; Fri,  1 Oct 2021 15:05:29 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id 134so11959221iou.12
 for <nouveau@lists.freedesktop.org>; Fri, 01 Oct 2021 08:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nTiUoToLt4vlwSsttW+8ux7qUW0jKK/cKEbzzJm6wPE=;
 b=pLmRpVHGmt4EhkzjJcPgwwuBMud4xu/gwyUZQUaISUob6rD+c8lF4DTGGVUB9JQzkD
 hQ1YoE5PIeNYZXIB7PdqLvcABEFtthJUap93ZBb3D41dA5J/MInxi15cU4AyPxCiMiDI
 MOyCTq9M2YzS8ufCa3CXjJ4hMQzfwAV2dcFTQ5TecSGwsu2X7sbufN+kHlNOX/RUh+Ed
 R2+5kQ8v5DO7F/kRVqU7gk0UkYaGVusrs63zbpnjNRn+0BO+putmkA+ovFxpI5M/HppX
 sG+FneitPugOM0aYsblm/atJgrmsNT44QYGqkU8UoEI+FGcAMtj1lV99f6mEyCvItgCE
 bbsA==
X-Gm-Message-State: AOAM532eANzPLRHT/EW8bjDfci5KSjg8cflfFZNSTJ/Ksy7cPRy2vRAg
 Cq4fsdV7EaXPbPOEfG7wB3ADgwXnj0oaRk7RY68=
X-Google-Smtp-Source: ABdhPJxtVsu7r4OkaaQ4C6i/CIumunsPOR6qcRCyVLUp5QWYe3q8CSnETK5682eehicexq6aU6p15u0VJTzJ7SgjwTQ=
X-Received: by 2002:a05:6638:13d0:: with SMTP id
 i16mr10158295jaj.111.1633100729240; 
 Fri, 01 Oct 2021 08:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <CABr8-B5YD4YGgcVfuqNGQumBSpuz8tFA0hEUJWZnHps6ZOKpMA@mail.gmail.com>
In-Reply-To: <CABr8-B5YD4YGgcVfuqNGQumBSpuz8tFA0hEUJWZnHps6ZOKpMA@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 1 Oct 2021 11:05:18 -0400
Message-ID: <CAKb7UvgXTkCTQhvK7A_98kfjicBxfJyH0nC_ya5y1wqYxFCfJw@mail.gmail.com>
To: Jerry Geis <jerry.geis@gmail.com>
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] Nouveau on Ubuntu 20.04 LTS
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

You can check the perf level your GPU is at, and potentially adjust it.

cat /sys/kernel/debug/dri/0/pstate

This should give a list of levels like "xx: stuff", with the "AC"
level being the current settings. Echo'ing any one of the xx's into
that file will attempt to switch to a different performance level.
Sometimes it works, other times it kills the GPU until you reboot. Use
with care.

Cheers,

  -ilia

On Fri, Oct 1, 2021 at 11:01 AM Jerry Geis <jerry.geis@gmail.com> wrote:
>
> I am trying to get Nouveau running and also playing video.
> lspci | grep VGA shows
> 03:00.0 VGA compatible controller: NVIDIA Corporation GT218 [ION] (rev a2)
>
> syslog shows nouveau loaded
>
> But video performance is SLOW - dropping frames.
>
> have I missed something ?
>
> How do I get better video performance ?
>
> Thanks,
>
> Jerry
