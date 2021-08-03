Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FFF3E3CF6
	for <lists+nouveau@lfdr.de>; Mon,  9 Aug 2021 00:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA1F899C4;
	Sun,  8 Aug 2021 22:14:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A82289DFA
 for <nouveau@lists.freedesktop.org>; Tue,  3 Aug 2021 16:10:39 +0000 (UTC)
Date: Tue, 3 Aug 2021 18:10:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1628007036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZhCR89X1oG7iNKpxBHqwK160maOrSQVKgeomxdN0wRc=;
 b=LwdXqV6TEL+jelWYIVu/L1AwkukJUhfDeR6fxf6HaCffMyf5pGalG64DdzD6SrFbnK74/x
 PVNjb7a8JiALCQD3CJBVmxfKVnGPRCXtU70BUFy11admR5LtOLT9dQeI/ENtXdJ/CkhTdc
 pZNvsYTpT+QPzjRhgzvNT0CjgoFJhxwmycapteSubpDkPSBjZ+FP8bxnvUSWW30Gz0Y7dW
 1ffy1Rr5tDaLDwQ1cWTtCeME4yw92tE3YUaDago5Lw9pEtw1H1L8au8do+a32W2/sN3gs0
 btcFKclunpFVufnMA6+fMpSDPoeRfMtyi+RFwzALyjj/jtaWzgKiRMXG8gO4tg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1628007036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZhCR89X1oG7iNKpxBHqwK160maOrSQVKgeomxdN0wRc=;
 b=CjGblo5JavDHAEsakSWenCqJ60bnDYFeC+TGn7n/YdarB5rRq+iJbcWjrVSzA5F0n0kDM4
 Vc1wmHGVCRR8DGCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Hans de Goede <hdegoede@redhat.com>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de,
 Peter Zijlstra <peterz@infradead.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Amit Kucheria <amitk@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Lutomirski <luto@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Ben Segall <bsegall@google.com>, Borislav Petkov <bp@alien8.de>,
 cgroups@vger.kernel.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 coresight@lists.linaro.org,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Davidlohr Bueso <dave@stgolabs.net>,
 "David S. Miller" <davem@davemloft.net>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Gonglei <arei.gonglei@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Heiko Carstens <hca@linux.ibm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Jason Wang <jasowang@redhat.com>, Jean Delvare <jdelvare@suse.com>,
 Jiri Kosina <jikos@kernel.org>, Jiri Olsa <jolsa@redhat.com>,
 Joe Lawrence <joe.lawrence@redhat.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Johannes Weiner <hannes@cmpxchg.org>, John Stultz <john.stultz@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Josh Triplett <josh@joshtriplett.org>, Julian Wiedmann <jwi@linux.ibm.com>,
 Juri Lelli <juri.lelli@redhat.com>, Karol Herbst <karolherbst@gmail.com>,
 Karsten Graul <kgraul@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Lai Jiangshan <jiangshanlai@gmail.com>, Len Brown <lenb@kernel.org>,
 Len Brown <len.brown@intel.com>, Leo Yan <leo.yan@linaro.org>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-raid@vger.kernel.org, linux-s390@vger.kernel.org,
 live-patching@vger.kernel.org, Mark Gross <mgross@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Mike Leach <mike.leach@linaro.org>,
 Mike Travis <mike.travis@hpe.com>, Miroslav Benes <mbenes@suse.cz>,
 Namhyung Kim <namhyung@kernel.org>, netdev@vger.kernel.org,
 nouveau@lists.freedesktop.org, "Paul E. McKenney" <paulmck@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Petr Mladek <pmladek@suse.com>, platform-driver-x86@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, rcu@vger.kernel.org,
 virtualization@lists.linux-foundation.org, x86@kernel.org
Message-ID: <20210803161033.vp3o34meyw3ek43z@linutronix.de>
References: <20210803141621.780504-1-bigeasy@linutronix.de>
 <83dc5dfd-1ed0-f428-826f-fb819911fc89@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <83dc5dfd-1ed0-f428-826f-fb819911fc89@redhat.com>
X-Mailman-Approved-At: Sun, 08 Aug 2021 22:14:04 +0000
Subject: Re: [Nouveau] [PATCH 00/38] Replace deprecated CPU-hotplug
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

On 2021-08-03 17:30:40 [+0200], Hans de Goede wrote:
> Hi Sebastien,
Hi Hans,

> On 8/3/21 4:15 PM, Sebastian Andrzej Siewior wrote:
> > This is a tree wide replacement of the deprecated CPU hotplug functions
> > which are only wrappers around the actual functions.
> > 
> > Each patch is independent and can be picked up by the relevant maintainer.
> 
> Ok; and I take it that then also is the plan for merging these ?
> 
> FWIW I'm fine with the drivers/platform/x86 patch going upstream
> through some other tree if its easier to keep the set together ...

There is no need to keep that set together since each patch is
independent. Please merge it through your tree.

> Regards,
> 
> Hans

Sebastian
