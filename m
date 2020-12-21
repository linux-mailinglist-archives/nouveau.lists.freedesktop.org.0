Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFC42DFC37
	for <lists+nouveau@lfdr.de>; Mon, 21 Dec 2020 14:09:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7284B89B0D;
	Mon, 21 Dec 2020 13:09:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7483891D5
 for <nouveau@lists.freedesktop.org>; Mon, 21 Dec 2020 06:15:21 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id z5so7833138iob.11
 for <nouveau@lists.freedesktop.org>; Sun, 20 Dec 2020 22:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=y5aSbAgqUHXifNTLv+q7038uWMQECH+CKBbAkMgWcc0=;
 b=YtEi5ePT12NGCjmUIO6kQUQ7Q21wFBbXhKdiUx0FVcSKN39KC3CMmcF3k2gapcJfSm
 cNTsK3DV0JDmaBCPG4vjOup4tV6RJDLBZUG1xwYHpITqNssV+OvboGB33vrzu+EmOsvx
 eyvnZhz4wptbSINtXdFHVcXvNQ4yIrfZmnk351IBvpwrxjJSEiVk/YB7HGm6/M/Wp+cG
 Yx3vMIBavO0keffwJUBDx7NXwqiKMeiYzjpnAif2IRkBOHUlGkZgNztyJgbqsW3KkEcq
 rUWSY6NduDAKBmq10WFTfDZMdIuEkpj/gec+sLoEth/cmXNWywWCmN8MiRs6pfaPq4eH
 NibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=y5aSbAgqUHXifNTLv+q7038uWMQECH+CKBbAkMgWcc0=;
 b=q/knOHiK3lCbeSWBFwJ1FEpxa780kaGS8GaAJvM/pZD8Q0AeXiJl7wgZkqK8fgrZb2
 RuoMcouKNW//AHxGzT/XDKrMnaoDF4249KUPgfrFHbFrTH+duqn8bdBsNEYYUmjM/gU6
 wzbYMZ9Wmztg94ORZNAxfo7ZW6wM0l1tj2pW5swSkf8fXY7EOaw2iwmFxAeCtoe9xog6
 fP+GLb8Ia0SSsF8Bmia70gLcgOJ4rkkx6sTbKAdNAwkCuBjfKUxvc+gJq6bSmqHfw48b
 EVqCyi5uazi/bOUJmwnFm4B8WODqwgFElsx9qfmCCTXkJFU4lWKebWHE7lADivGppBpq
 PGkA==
X-Gm-Message-State: AOAM533VL60HO4lLLLG1lT4BDJJFzFTla2jRzW8Lacd8EpeCQ4riVFKU
 /QJUaZjRp09s3KgiZqSzzFEYp0SdYHjA5XpoegmQjQhsCO/Y/Q==
X-Google-Smtp-Source: ABdhPJzP2+X+tuVnDN3+JaUWodptF1vYUkhzaysMWpt2YXUv7zHy0nmJkzRWurX/b7hO7BTP5+vvYFDXYbtsrxaHCN4=
X-Received: by 2002:a05:6638:ccd:: with SMTP id
 e13mr13765563jak.140.1608531320855; 
 Sun, 20 Dec 2020 22:15:20 -0800 (PST)
MIME-Version: 1.0
From: Nikunj goyal <nikunjgoyal31@gmail.com>
Date: Mon, 21 Dec 2020 11:45:09 +0530
Message-ID: <CAL_w6bPog2DavwTb08AVazC9X=VD5povvP8Xbfej9PAK5gFG0A@mail.gmail.com>
To: nouveau@lists.freedesktop.org
X-Mailman-Approved-At: Mon, 21 Dec 2020 13:09:51 +0000
Subject: [Nouveau] Xorg evoc
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
Content-Type: multipart/mixed; boundary="===============1828227496=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1828227496==
Content-Type: multipart/alternative; boundary="000000000000fd5e5b05b6f36199"

--000000000000fd5e5b05b6f36199
Content-Type: text/plain; charset="UTF-8"

Hi everyone,
I was surfing the web and i came across this program endless summer of code
by Xorg and wanted to ask if it is still active?
Thanks

Regards
Nikunj goyal

--000000000000fd5e5b05b6f36199
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Hi everyone,<div>I was surfing the web and i came across this program endless summer of code by Xorg and wanted to ask if it is still active?</div><div>Thanks</div><div><br></div><div>Regards</div><div>Nikunj goyal</div></div>

--000000000000fd5e5b05b6f36199--

--===============1828227496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1828227496==--
