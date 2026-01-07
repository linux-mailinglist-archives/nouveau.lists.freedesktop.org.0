Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC448CFDBC6
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 13:46:35 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AB33E10E5BA;
	Wed,  7 Jan 2026 12:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G/PF4M4u";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4656644CAC;
	Wed,  7 Jan 2026 12:38:19 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767789499;
 b=SyIpfMeCpJm6E9+cpadpWBOmI5oisRdXXT00WdvtfyPT2/svk9i3AsLJ8C3Rdgd3wWgDr
 8E+nyB9DrVIOR0gyajPIqPMelZzXJtoxQJTuye6xdBlf/donsBSvfsN9UfhNOS4/IyTklbT
 qUovWnoc5y6nOS58EM+xDnPam1t89iKWvHwGja4gxUpXB7XKRL/eWMet2qL7GDQlU5UIhP6
 z0Bc7YKSbnfXiNa0eqmXytsaw2suOI4vPdbNcuMDH1s6IyeGODQX+YY7+ZL/Z0/eUx23GEm
 li4p4orLE9sShvsHkeu7L4s+i/QnFO8Yl9aA40hSlxvG15jeTCNqwbJN3qNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767789499; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=diRXR2Re1+OHdUMzqSTY3/4W/RblejFu9jTBjKLGYAo=;
 b=caC24BLl0/VIvlOVXlhdKyBwhMXr90NevgNxBeuoR27iqyevK2CrWjYifT8mslXBY5ee5
 PY9CzzXO2kZx9EWs1mbQ3TKy/HgSn3C8yi7EBFXLO0TEalnWKjx5eCYCMhMJneSFVpAr8pV
 CJjmO5FQaxUX8OegPjKIpZ3si35DSiqS7IsLHL5Wq7vPNxd1s20LE8tq36ANwTXvJIAIu+v
 ujosItda4g2Zaz7KgsfiFRVG3ctHG/36gpWCxe4faceHaiS3fyPqIxHjgOt+t3MkorNwkeY
 hTS4p/Dq62n2yCNo5JZ5R6d2zrfv22DuO8JFjdf8X8FVaq4fkmKBXnt41z7g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5FAE044C9E
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 12:38:16 +0000 (UTC)
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com
 [74.125.82.41])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 73D3910E5B7
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 12:46:31 +0000 (UTC)
Received: by mail-dl1-f41.google.com with SMTP id
 a92af1059eb24-11f450147cfso118510c88.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 07 Jan 2026 04:46:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767789991; cv=none;
        d=google.com; s=arc-20240605;
        b=gupBjl3bY6jQEEWLMyr4Hmib9x2N4OaPDWQM/joEfC4sXBPKeXNQ38Wtgy4sQyP7PT
         gU/5RnL9A/ba3DSdFi6MO3BB7udjdXXq493gvpWD9RO9p1VY/Jtv+w0XTQ2qnRxvveIq
         x4beKQndIrHgaQDRidZYRxRLnxbUsBomUwgli/P0lOgoSpzA2no1P5JJRSPrO8EiM8w1
         FdSZEnUsNpU4RYuG+S/57AzJTU2AtQVwEnUfHMgyPcKfn/2n5+ze5UnmH4cbkI17Rde/
         T/P+uJs1VPURtGjltsTroQtI/f73iMa8CjEOVyuVDf2yLh3KoBPEQag9+0HgJflYb3K3
         Kx3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=diRXR2Re1+OHdUMzqSTY3/4W/RblejFu9jTBjKLGYAo=;
        fh=hJh/CRBjK2DTNxs7QSkFPzNWwfIW9kKpHprAMcpPLX0=;
        b=MYOfkbHknMIUGFvBewAEhIIS/BFhu8UVBT/N2mC5EMaQRTub3+k1DFKkgKnnWJ1XvB
         9yNCsOKHa23QK45ebsV44vBWuidrtGPDd9yGylg3UwbizwWv3J0tQAstIgHed0Qs66VS
         CSZlfRIB3YuErudqJ2lFpIhl0XYlp2ymbLCFI7OzxmUUNUiY5wRrejiYQacaboRrqCiJ
         JdFy/tOf1aHRqACEkP/Tn3As1ll+cIbnoZKFVVCqd68FPFV4NiXKzOSKK0kLdshnhhO7
         T5T23dc8KefEFTT7dw5uioadPWXJ0TB/aaYqoIa23vHcQhzp0ehmsTUaUgZsVt13oFu+
         ZSIw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767789991; x=1768394791;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=diRXR2Re1+OHdUMzqSTY3/4W/RblejFu9jTBjKLGYAo=;
        b=G/PF4M4urC/adLCb84EqfgcSF/IGVf1/S6Ccb1uH4ThxXnnILW/Y8vXE5NKp5FR4d3
         CKAgO0KWAHL5Qhj0IcQx2KMpOJBd75wvk4jwbbFXwiIEpufpiC5zSQO6a8pc0YZiCHLS
         ukb7V8+uSM5LznFTQEbeWLRxbcgdaOu6LF8JzBj3KkUstKDLXX/wsAGYc61jyNJ3BV7J
         atuo+9z+FRdD2/I27+BHGoLM+mqk+6fgE8s3m23zG3KPcD9Kfc2oPXirqm7Q5WnJ/mbH
         +8MnoyGwbGIW2sZLAxks7pGM8hSUMXKmwCQ38zE7Vz+kAgEwXMsPdW4CHYB3CukbHp0K
         RicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767789991; x=1768394791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=diRXR2Re1+OHdUMzqSTY3/4W/RblejFu9jTBjKLGYAo=;
        b=BjtXZ6VAU8//Zn9yfRnSH1LKIoAgfpM1QrQXnGMD+l2fcFpiNb4on2i2MsAuFL8KDj
         KLCHQATfc49fheqRLriu9pNL9j9FxVI+sargjhqVKjPtNBY224ICDbERukixuu49VZIZ
         efOft82Nh7+stfYFR7lyLyaC7grDBEWx+QKL1cnMAQ0dcFsLndJkOv4S5N1Lh2lNqOFT
         OAwAoKX0cJ09YjregcvJfMYUmUgU1+lmvsakc2K37/1d4DNE/Gl7QKo9Dt1LJn8WIl/6
         2b9VSkiKqUSoslgtk83JHafOoCxa7zaxZ39d7BG8Pghv+/ippiBNG6zMkERt6/4bYEgK
         AH3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2d17lxyBD/S+xEMF+EbgDfrNTVH/dOkADrw4Yg+UjlCLhp2KjkoegXtTvQsrWKZtthVlIOwek@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwC/fOU8P39IeUR8EfdpPZ6X3c8FMeehPi+iYWwXqtebcQ1UORY
	2o3jzTESMQcffaXH3z9tgoLwZZVqH3S16eeTfOwAZ2kT6yzJ0hI7E/AnFP4suBBmkk5jSZuCLvb
	zbBUVrJ2/zrkgltFmuFJdazd5fvrOZJQ=
X-Gm-Gg: AY/fxX6K+oH91Wkj/MSjTG7YaGsipuQYRHY0EBITr5I8OnVyMDFVPgh2LpzKdjl7bWT
	r+8hbuok7Xw7LKaJQZBnBUwm4v3Dci4b3BhwjLuujcJVErYW4eJU56BRmTyWb7P0H+3MHT9VSid
	qqrJcRM1pLwjj/qAgfzcl9HW1Chp9LcA80rD9yp4vpqXPuoSpd5xSe66qDL0MwmcypAQHooEggF
	nPgpPcJrnRHXatv4FIMdxLxfMtKuBKMaf3451RVTBYpCS+pbm99PJ5QuHfP7zqhtj7Psmr84TVD
	h2zpyHVSZhLTWkFeeBsxCT2ydU9779/5mlCNhFDTMIJdC/1t0wQ2i4qupaEGmPy2j/SRSpm4znI
	OHtC30a4bzacBMC2a9b+XFAQ=
X-Google-Smtp-Source: 
 AGHT+IHBFO+bAPP6V9b03rrjN1+f1r7uZEP39oWoXoE9m/s7w6G4H7XkX2N2kHMKJjrXVBAD8G3GKTzc0IzPpMR3ns0=
X-Received: by 2002:a05:7300:ad08:b0:2ae:593b:2163 with SMTP id
 5a478bee46e88-2b17d2b80d2mr977198eec.4.1767789990606; Wed, 07 Jan 2026
 04:46:30 -0800 (PST)
MIME-Version: 1.0
References: <c5c5c0a4-249f-41b0-b5f1-87a58514b120@nvidia.com>
 <8822A0A5-CD4C-403A-A001-F4E7A351D81B@joelfernandes.org>
In-Reply-To: <8822A0A5-CD4C-403A-A001-F4E7A351D81B@joelfernandes.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Jan 2026 13:46:18 +0100
X-Gm-Features: AQt7F2oY3rJVLUAzPCfQNldNx5mLoh9iddgjtwFpYIBSLt204r2ybXXsoi4kwrU
Message-ID: 
 <CANiq72mUCGL3f=GAYSZfMV1=NXpOjz4vsV7B3Pd-=EG8tmWC_A@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update email address for Joel Fernandes
To: Joel Fernandes <joel@joelfernandes.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 5SM7HSDV7ZYSRNKB7SW3O4KFZH6EGQO6
X-Message-ID-Hash: 5SM7HSDV7ZYSRNKB7SW3O4KFZH6EGQO6
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 nouveau@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Paul E McKenney <paulmck@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Steven Rostedt <rostedt@goodmis.org>, rostedt@google.com,
 Yury Norov <yury.norov@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5SM7HSDV7ZYSRNKB7SW3O4KFZH6EGQO6/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72mUCGL3f=GAYSZfMV1=NXpOjz4vsV7B3Pd-=EG8tmWC_A@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Jan 6, 2026 at 11:56=E2=80=AFAM Joel Fernandes <joel@joelfernandes.=
org> wrote:
>
> It is more important that mailing list traffic does not have issues which=
 unfortunately us and other company domains have experienced. I have been u=
sing my domain for a long time without incident.

You could consider a kernel.org one too!

Cheers,
Miguel
