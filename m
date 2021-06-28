Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FD73B5886
	for <lists+nouveau@lfdr.de>; Mon, 28 Jun 2021 07:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A6E6E0B7;
	Mon, 28 Jun 2021 05:13:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 308 seconds by postgrey-1.36 at gabe;
 Mon, 28 Jun 2021 05:13:23 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272966E0B7
 for <nouveau@lists.freedesktop.org>; Mon, 28 Jun 2021 05:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1624857201;
 bh=p4NyXCslf/2NNSWvkidrJjQDtMBO2qbsRymu1UVAzTo=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
 b=EbbC6a+6oW3Rq54dCHDjxLvLMjtlQLie9yLk8QHl2ugoqbneZvvBVdeG8wY4JN6Uq
 Kk5aD5zFtkvXCiPyOfnD3KWA6X1cdG6A9gICTJ+jmZdEo3Murvw9F+mHDYj5QA6CuT
 RRLvCBBnNPkgQiaxRjVxqW7JEoIjxyWLmwvHZaCw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.fritz.box ([185.221.151.107]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxUnz-1l06Wx2oo5-00xwDP; Mon, 28
 Jun 2021 07:08:10 +0200
Message-ID: <9e57eba845860ec1bc613478b62734b678310fa2.camel@gmx.de>
From: Mike Galbraith <efault@gmx.de>
To: lkml <linux-kernel@vger.kernel.org>
Date: Mon, 28 Jun 2021 07:08:10 +0200
In-Reply-To: <f3cb7efc616be532ab2dc9f3ac2e8611dd643888.camel@gmx.de>
References: <f3cb7efc616be532ab2dc9f3ac2e8611dd643888.camel@gmx.de>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Provags-ID: V03:K1:E+6AU6Qt5ySmV7t1Tfx6olcMt6iU91fFVtD8qMcCMNx50Mjx3Y4
 eAc6W12nOttRYjTDfVYy1o7xlO/HqmeX3b6ja02+DNtu2WjR7w+7O9RcWtwksyYmLRj9Q+M
 09D0IIOyAxQnPNrHDBPk8WvDsBgd6n7v8L6kKlnuPmsh9znedK/fCs3cFT6e1kcpy7KwTsk
 ieAWhf138rQpu7ibUC1QA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:d1sAKHHrs34=:LcCVNDB+TPrQJwqiBsXnfI
 bzGeKHp3s3XkAL4VcS0cIeXgrE8cUTVvtGYmvD1Azrr9p/SWJQcYpit5IhwBLjRaix5Jk8gPf
 EoTLuQUsP+vndo+aCyRSPxsPTC2d11kLrOt9uFHCdM00MN/Q+ATJtq5YEWjTW2lIJoawbl+bz
 B+YtVdeqaEmgIOhIJamlp4zD9ILJD83LvrxQi4+u2fqVuZJbK0h2bG7no0Y2rNuRNl77NgnVo
 drx21US8MhZKL86X6556UqIaG8i9lj7MXafYTIOhYi/4mQIKMJaz4qosBkxfHcnZo7KI+OynR
 VAzpa7OuWwQa6n3K0aK6TkJtqF4L/zYNSSeG1C3WWnHv4V993KMr9beC+Y52JY9MfF0vJMAs1
 IK4b3Ur2oDZZ1KSxbWnVGr2eOYT86K0b1A0YyYZ3/7pC8B2J8Ty01/fup42u2TKYBPRg1ZFi4
 BAq8gCpyQGe5Icjtnd32SuX6uzGoVIQlsnZ4jvoO7NYN4Xhze0fNuin9/Y38AcA1k17/ERERE
 zmaDeoFgvi28Rkh9nf5L0QAHGaMKFOBdEY0b5DcjSP6eEfqvfqfYXF7DQTe7vuW/izcVyCFid
 HszsQEQu/KFp4l5r4pldsDjSt2OkZzhLrEj+qH9z8m2PbRO8G1X4fWNB53Dy4PnZNP9JXXD9m
 Cv6mm0+5Vf9LUlO/jHB9sMOSNlNbdhKz5vvmAkW/uGzTkLnOolcxVgC1ps489sgeI6veSa3YX
 yr2GyaVdmWKcXfjxpg9gJMzFdsjmaZqr7+Kri+LCg5jvV9MsUJylCxC7NFJprGYWVuPxsfpFp
 /5T5zBxyo80gCxLrAq+c77x6ik7S800rQaQKHrhf2OK4vmiaCCbPtB3mPeCcaCGe5jQ69wYnb
 01PwTyYiGFYq+IFfwUgfLKf+1spZTg6xRUdNfwEAQkPj0XuHVWb12U+s+abZu/h2SQRpvzZiC
 7FGePZjERvsM7rLcCbKRuGZQ6uw7VTom10qj+H3UxH0muoxKiF4AcY335GLp9+qCk+IKHc66n
 WASQMEeZXTeqU6wWu7SmkRTrVml4IivgPbrTEtvEoHwYaMHBlRfCKYUbDIkDj+SC4Eq1z355o
 LKuEBCKZLHuJPFBU4i1imaHINLMrYT77eJB
Subject: Re: [Nouveau] drm/nouveau: lockdep circular locking dependency
 report
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

I've now applied a revert of 551620f2a3816397266dfd812cd8b3be89f14be4
to all trees where lockdep may be enabled to re-hide the inversion.  It
thus won't every remind me of its existence, thus I won't be inspired
to pass that reminder along.

	-Mike

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
