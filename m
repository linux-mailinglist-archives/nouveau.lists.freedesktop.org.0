Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FD5CF7D8F
	for <lists+nouveau@lfdr.de>; Tue, 06 Jan 2026 11:42:20 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFF510E1EF;
	Tue,  6 Jan 2026 10:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="DYrTrwa9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0FCB144C98;
	Tue,  6 Jan 2026 10:34:06 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767695645;
 b=z1YL3Fys239c0KB3HLSqlWz+DbwX920HEoktjkBjxW3UgFK3xHYfxsn1iEk02ak8cNPIQ
 D0BJCokuqymRoDGFcRweEe296SiQ9UoxCxSt9laJOrrCqGmM4IGKAsi3+RX914KdJc1SxxD
 /hyanvt+UZdd0LuQI1u9J2llzbNZibl5mxE7Te0f9noJFwJVlY36ZS+uigX5OSuxDA8Fv3i
 IzOhGkO3ouOYStBS4Ci8MBoFMsG1y+6S+Cna2XYITGvgdxsJ7tjddDXkbcYLdbwzQdS6DlK
 ryQCSeECRbhXS6OjcyPTbkvKiwbdlLMOjLeMpk810Jb5wn5QJKm+DiZdyYwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767695645; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=m4DHnNlD64p5h6wOoVrrAqDFywUoVYTzLxl5WN2rbRU=;
 b=V0m43XAGeMk8pQBNU/Siwt26FLxo6pm3CQEETF0R6L/V4ayYK2IX02sQBF7d7nGF3djkd
 m5sIQVHbV1fMNPtNuFy5dZO02fpPHywuv01H6TnRSY3vnQ3WrqOBEcu+I68QCj+ibGTOVm8
 UTUgBJ9lc0AA7nFDTDru28S6rDDl0atOtxno7D1j3nydBq3Gc5iqHOb2uTlSHVAO77Pfyg6
 pZ1fvqRojsdkMSCkxNLFAc9FnN6DCPYJjgOmQHl7h2WUEWaAB+n9dGYFV1bHy2zZG7JSg0h
 IzE7SDzENVOH16mdHUT45f2cSPbx3USZpbhdywdIEb2M1Q1D1Vm58T2qoyhg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=joelfernandes.org;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=joelfernandes.org; arc=none (Message is not ARC signed);
 dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 83C0B44BB6
	for <nouveau@lists.freedesktop.org>; Tue,  6 Jan 2026 10:34:02 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3444110E154
	for <nouveau@lists.freedesktop.org>; Tue,  6 Jan 2026 10:42:15 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-c1cf2f0523eso614460a12.3
        for <nouveau@lists.freedesktop.org>;
 Tue, 06 Jan 2026 02:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1767696135; x=1768300935;
 darn=lists.freedesktop.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4DHnNlD64p5h6wOoVrrAqDFywUoVYTzLxl5WN2rbRU=;
        b=DYrTrwa9RDDPZ7t8WDRHouIPq3K1dpEFVeZWawG1WY6XM8TUwx0jNk6XtUWTBDdG1Z
         Ml1psbQZDR0SauET+jRyCyOnpKIXOJ4ny/eFo9/IjHtUNZPdRQovtNJH2rlZKTAeQZl3
         JNzTxtUtOqna3JT0qfpjf+49ihHPzylpCNupE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767696135; x=1768300935;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m4DHnNlD64p5h6wOoVrrAqDFywUoVYTzLxl5WN2rbRU=;
        b=rLDDO02QFaHNT3Im0W/fguZsRqRJRFwVSrZePSGKD0Z+WDSkyKeCrqm4JURmj1Kb8x
         EhguZPEZ7KtwVVhwmGCiSewusgWIJIFxe5uIbGr/KQwt73R8pevYO/9zNl404DWxipJY
         y5h6ESwizxLxDaZ70wwRBLjK5CerscYqS29gK7tZWRFWN6la6nYzfExJLvhF0xyg/Qm5
         56kc/C40My4YOQBJR13uCt7c1RJD6yl6TU4GvwzGDwK5ThFUvuZWDHAMtuugEWsSXndI
         +VAAKCQBBtLEwRuNoGVzQ17+/qk+8T/Fl8IysS75Bh4x8DNI4hKb63D8DVXQh7S5aHQv
         OrSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf9GGLScf5tK3QG7ZhU24dZSD67lgZbKS+U02W5THZWjpgSj4aeHaHrQm6mcfw2biA2a6ZnTp8@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMk2C4f0j9IJPmBoPqyI+u/xxw2prti/+dkgq111/Ux9JmEZ1v
	nHkmTKzADxoOEQT6mSTb6kF+OdCdfFE8zdK88DfaLlBZK1fD2dKmsr1fZjYLpE21C6A=
X-Gm-Gg: AY/fxX6b3WgSDN3WCG53aXyaczG0DMiVArDuzGNNbhONM7KQLVYCUBBp9zNkplTBxRC
	NEuj4NoxyzGBYOLdS8XvtFEspo2Rj28YcCbovsbTUofWuq+zHJoPXYvZ+AqVPZmQARAT0cLvYcv
	JxQECo8e+d6Bcpha4zO2INkEPdMZUgLlhSJ6Jfhvm4fQiTfDEwswtTv6GFTadXnhty/79S+UiY7
	UGkM93Tlxl151utVGkJzvhP7n8vm6VQpziu3AMADIUEXjHtpHsuUllZhcx4l7kMTN7Q6xJxYHDL
	hPdP1fLSRAsqdzSd8f1POghYDwzXzyD01SAuf5UlzN6q43qPNBwRUNjz2oATxgRSTnN0+ct0vif
	8WfgnVudpK4+zKgyNtZtdMD5oEOUe3AZcyuSL3s/zjGL157MI2wupuO1Utpmo/hnitrrsm6FnlW
	jEdPRon2hL7PGvWcLPqjar8ED8h6zC5mlWag==
X-Google-Smtp-Source: 
 AGHT+IERN4NTuUg9631IoqFFmDFc+SSm8nsSJiPXRRuyNQlJRcMWfJpX1DUlLRv86z28+rD5rpiQ/Q==
X-Received: by 2002:a05:693c:839c:10b0:2a4:7cb9:b7da with SMTP id
 5a478bee46e88-2b16f91adfamr1668838eec.25.1767696134508;
        Tue, 06 Jan 2026 02:42:14 -0800 (PST)
Received: from smtpclient.apple ([71.219.3.177])
        by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b1707d57aasm2365350eec.30.2026.01.06.02.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 02:42:13 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Joel Fernandes <joel@joelfernandes.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] MAINTAINERS: Update email address for Joel Fernandes
Date: Tue, 6 Jan 2026 05:42:02 -0500
Message-Id: <8822A0A5-CD4C-403A-A001-F4E7A351D81B@joelfernandes.org>
References: <c5c5c0a4-249f-41b0-b5f1-87a58514b120@nvidia.com>
In-Reply-To: <c5c5c0a4-249f-41b0-b5f1-87a58514b120@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
X-Mailer: iPhone Mail (23B85)
Message-ID-Hash: RLXLZGZ2G3Y3VQ64IJBAUYEMVFDZ5UMM
X-Message-ID-Hash: RLXLZGZ2G3Y3VQ64IJBAUYEMVFDZ5UMM
X-MailFrom: joel@joelfernandes.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RLXLZGZ2G3Y3VQ64IJBAUYEMVFDZ5UMM/>
Archived-At: 
 <https://lore.freedesktop.org/8822A0A5-CD4C-403A-A001-F4E7A351D81B@joelfernandes.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>



> On Jan 5, 2026, at 10:22=E2=80=AFPM, John Hubbard <jhubbard@nvidia.com> wr=
ote:
>=20
> =EF=BB=BFOn 1/4/26 4:30 PM, Joel Fernandes wrote:
>> From: Joel Fernandes (NVIDIA) <joel@joelfernandes.org>
>>=20
>> Update my email address from joelagnelf@nvidia.com to joel@joelfernandes.=
org,
>> which I will be using for community email going forward.
>>=20
>> Signed-off-by: Joel Fernandes (NVIDIA) <joel@joelfernandes.org>
>> ---
>> Boqun, could we take it through the RCU tree for 7.0? Thanks!
>>=20
>> .mailmap    | 1 +
>> MAINTAINERS | 4 ++--
>> 2 files changed, 3 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/.mailmap b/.mailmap
>> index 84309a39d329..279f8fb223e2 100644
>> --- a/.mailmap
>> +++ b/.mailmap
>> @@ -389,6 +389,7 @@ Jiri Slaby <jirislaby@kernel.org> <xslaby@fi.muni.cz>=

>> Jisheng Zhang <jszhang@kernel.org> <jszhang@marvell.com>
>> Jisheng Zhang <jszhang@kernel.org> <Jisheng.Zhang@synaptics.com>
>> Jishnu Prakash <quic_jprakash@quicinc.com> <jprakash@codeaurora.org>
>> +Joel Fernandes <joel@joelfernandes.org> <joelagnelf@nvidia.com>
>> Joel Granados <joel.granados@kernel.org> <j.granados@samsung.com>
>> Johan Hovold <johan@kernel.org> <jhovold@gmail.com>
>> Johan Hovold <johan@kernel.org> <johan@hovoldconsulting.com>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 12f49de7fe03..43bbf12e2c80 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -14558,7 +14558,7 @@ M:    Luc Maranget <luc.maranget@inria.fr>
>> M:    "Paul E. McKenney" <paulmck@kernel.org>
>> R:    Akira Yokosawa <akiyks@gmail.com>
>> R:    Daniel Lustig <dlustig@nvidia.com>
>> -R:    Joel Fernandes <joelagnelf@nvidia.com>
>> +R:    Joel Fernandes (NVIDIA) <joel@joelfernandes.org>
>=20
> Hi Joel,
>=20
> Can you please hold off on doing this for a few more days? We have both
> NVIDIA and Microsoft involved in fixing the email issues, and it looks
> like they may already be solved, in fact.

John,
Ok, thanks. It is common for corporate contributors to use company name in b=
rackets though and I have been using this convention for a long time (as do O=
racle, MS, Google etc and even some at Nvidia). Is there a real benefit to u=
s? Tagging company in the name is in fact better for visibility IMO. Especia=
lly in screaming caps ;-). It is more important that mailing list traffic do=
es not have issues which unfortunately us and other company domains have exp=
erienced. I have been using my domain for a long time without incident. In f=
act I used it at Google for this exact reason (with proper attribution to Go=
ogle).

Boqun, Paul,
Let us hold off on this patch for now while we are trying to resolve long-st=
anding issues with the public mailing list software and policies related to o=
ur mailing list conventions. Sorry for the confusion. thanks!

thanks,

 - Joel



>=20
> thanks,
> --=20
> John Hubbard
>=20
>> L:    linux-kernel@vger.kernel.org
>> L:    linux-arch@vger.kernel.org
>> L:    lkmm@lists.linux.dev
>> @@ -21895,7 +21895,7 @@ READ-COPY UPDATE (RCU)
>> M:    "Paul E. McKenney" <paulmck@kernel.org>
>> M:    Frederic Weisbecker <frederic@kernel.org> (kernel/rcu/tree_nocb.h)
>> M:    Neeraj Upadhyay <neeraj.upadhyay@kernel.org> (kernel/rcu/tasks.h)
>> -M:    Joel Fernandes <joelagnelf@nvidia.com>
>> +M:    Joel Fernandes (NVIDIA) <joel@joelfernandes.org>
>> M:    Josh Triplett <josh@joshtriplett.org>
>> M:    Boqun Feng <boqun.feng@gmail.com>
>> M:    Uladzislau Rezki <urezki@gmail.com>
>=20
>=20
