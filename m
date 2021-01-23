Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCC1301802
	for <lists+nouveau@lfdr.de>; Sat, 23 Jan 2021 20:20:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8417F89C6B;
	Sat, 23 Jan 2021 19:20:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6981F89C8D
 for <nouveau@lists.freedesktop.org>; Sat, 23 Jan 2021 19:20:08 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id q9so8367202qkn.2
 for <nouveau@lists.freedesktop.org>; Sat, 23 Jan 2021 11:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/7YpGN1jo6dGz8+C8ririhK16/u0V0KlmB1GR9o2iY4=;
 b=g4acV3AdmOPDNjKLDS92bgec074dZFGYnMdWkeqTSADS/sznRu6G2EH/O7LCj30Y34
 p4CiSdQAg+uo+i3I4l5L4f+twvkVrsw1pALIxaSK0CEBqkZN8kL/xhtygIDXhyAjhSkr
 2zSXwAS+1HYviz0eWnOYZDejdh8tKGFql4BEiCpibaaY8KU2yztNvV84157IOk5YANUN
 8W8PYBa1TM9fphlHk6FmThPUpRA9Ddt5LtbwrLpbjHv40IzXTOqyqTct/hhE01kK0Ybv
 GLARPHRqZY3HtB1vX097C9d1QnfDwoyjtJugPuOOJOwTKAEwQlOlT5YsBGBy6XxAKn78
 dAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/7YpGN1jo6dGz8+C8ririhK16/u0V0KlmB1GR9o2iY4=;
 b=JueM6Ybs3z+NRBdXIUSteYU+zvWb8YHs1V8HjqW0KPRkAtLBnXv0zlwT09SszXzuj7
 nv6AgKfnoLleVkM7oTITHX3V6YqhkfgkkazsfOfXkiSOsruC3hRkiz7ga84Sh+skqmG8
 X0aeoAILwuEe3CdNLAqfOF+AulEuZyl/YzuLlVvG4E6gnUWYCCrK/4Zg5qEpvMMWkrYS
 cDyHj0J/jpu8PJZWBhk7k44NT1i2IuDDEUlpXP8CeC+7flJ7lQze+q4KqbWIiJGWtE4O
 xQh/ylQb7GRrBgJXOtPkqEzRg6CwNLI/xJRwi1yaIfhmxhRB2Ihnp7hlswjITHikxW6a
 kGww==
X-Gm-Message-State: AOAM531g8Lyp2q83laXO6HzqVFFoHSFskQpVy6N2ns6q2KxCkXcFJ681
 PlAeVrGwjuEbHWHDnwIDxnw=
X-Google-Smtp-Source: ABdhPJzD0ehS8gygRANCYtExFnR5fqf20nzA8wBsLZFX7L5d4y1vZDKXMbOasSRRVRzYv9COXsLqjA==
X-Received: by 2002:a37:ef10:: with SMTP id j16mr10299266qkk.129.1611429607266; 
 Sat, 23 Jan 2021 11:20:07 -0800 (PST)
Received: from athos.glmx.com ([70.19.70.200])
 by smtp.gmail.com with ESMTPSA id k23sm8258206qtp.61.2021.01.23.11.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 11:20:06 -0800 (PST)
From: Ilia Mirkin <imirkin@alum.mit.edu>
To: xorg-announce@lists.x.org
Date: Sat, 23 Jan 2021 14:19:57 -0500
Message-Id: <20210123191957.24443-1-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [Nouveau] [ANNOUNCE] xf86-video-nouveau 1.0.17
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
Cc: nouveau@lists.freedesktop.org, xorg@lists.x.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256


Carlo Caione (1):
      Don't advertise any PRIME offloading capabilities without acceleration

Ilia Mirkin (8):
      nv4/exa: tiling is unsupported pre-nv10, reduce alignment requirements
      dri2,present: move in pixmap before getting addresses
      make error when failing to allocate surface more descriptive
      drmmode: fix screen resize without acceleration
      present: don't enable if there's no acceleration
      drmmode: make event handler leave a note that there are stuck events
      present: fix handling of drmWaitVBlank failures
      Bump version to 1.0.17

git tag: xf86-video-nouveau-1.0.17

https://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.17.tar.bz2
SHA256: 499322e27a55c8183166bf2dd1e47d085eb834143e0d7036baba8427b90c156b  xf86-video-nouveau-1.0.17.tar.bz2
SHA512: adba58ba5298d1a5b3f9f8540f9ef2cb2e10e47bba8e374103ec2e1f92e915f5f4393ed0021168cd649646e12315135a1efcdf77e8fb1648e1295914d87279b2  xf86-video-nouveau-1.0.17.tar.bz2
PGP:  https://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.17.tar.bz2.sig

https://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.17.tar.gz
SHA256: 21e9233b2c6304b976c526729ba48660c16976a757a319fa95cc8a8605316105  xf86-video-nouveau-1.0.17.tar.gz
SHA512: 10336f521d39289b214ce640b8b7195f4709ab780a4057ba83d02c2f3b4f7c7b17e37cf5f3224c43bf39aa8939a8836be1ee9eb26901d713cb98d161db2375e9  xf86-video-nouveau-1.0.17.tar.gz
PGP:  https://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.17.tar.gz.sig

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEv7mwwnbVdnxxAIbvsXi+TqB13gcFAmAMdncACgkQsXi+TqB1
3gdS/Qf+NuLPs8PKUjwyEZNl5pDchnRkqsNVie22oguVUqhI0VgLYjBxPBwvoiZz
iyDJwRSIRgIR5YwIjz/YZ4SBx2TI7pESjxfYAAowOmxMNe3jiQIOC8OChmQFPEtl
a9NdiKJifpex34y+YnXwZjGqUo1aG489DPCjeOKH4WoNB19LlV6sD1bHj2QxLAUc
lqzZ2Hq8Nb6RVb0LRyywEccMA1jRlW0re1W8/3igBznPUunk8hznGpbFDtmUvVqc
sOvkW1iwP8BWt0/pVG2iikIhaQvtrWF5+9XgqjC72RCo4iaGycJCS/GvQV6xWVVk
L3AvL1HjlKLc9xIMQcp/44vkhPKJTw==
=6/s4
-----END PGP SIGNATURE-----
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
